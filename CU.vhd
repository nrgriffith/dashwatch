--------------------------------------------------------------------------------
-- Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 11.1
--  \   \         Application : 
--  /   /         Filename : xil_3364_22
-- /___/   /\     Timestamp : 11/21/2009 16:58:34
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CU is
   port ( altb   : in    std_logic; -- comparison result; 1 = TM < SD, 0 else
          clk    : in    std_logic;
          css    : in    std_logic; -- compare, store, and display shortest time 
          pps100 : in    std_logic; 
          reset  : in    std_logic; 
          start  : in    std_logic; 
          stop   : in    std_logic; 
          ds     : out   std_logic; 
          entm   : out   std_logic; 
          lsr    : out   std_logic; 
          rstm   : out   std_logic;
			 update : out   std_logic );
			 --S      : out   std_logic_vector(3 downto 0)); 
			 end CU;

architecture BEHAVIORAL of CU is

type stype is (S1, S2, S3, S4, S5, S6, S7);
signal pstate, nstate : stype;


begin

    -- For debugging purposes. LEDs 3 downto 0 will show which state we're currently in
	 -- The state number matches the state on the state machine diagram (Figure 6-26 in the textbook)
    -- Note to self: don't forget to do pin assignments for this, as it wasn't part of the lab
	 
    --with pstate select S <= "0001" when S1,
    --                        "0010" when S2,
    --                        "0011" when S3,
    --                        "0100" when S4,
    --                        "0101" when S5,
    --                        "0110" when S6,
    --                        "0111" when S7,
    --                        "1111" when others; -- error
									 
    state_flow: process(clk, pps100, reset)
	 begin
	     if (reset = '1') then
		      pstate <= S1;
		  elsif (clk'event and clk='1' and pps100 = '1') then
		      pstate <= nstate;
		  end if;
	 end process;
	 
	 next_state_assignment: process(start, stop, css, altb, pstate)
	 begin
	     case pstate is
		      when S1 =>
				    nstate <= S2;
				when S2 =>
				    if(start = '1') then
					     nstate <= S3;
					 else
					     nstate <= S2;
					 end if;
				when S3 =>
				    if(stop = '1') then
					     nstate <= S4;
					 else
					     nstate <= S3;
				    end if;
			   when S4 =>
				    if(css = '1') then
					     nstate <= S5;
					 elsif(css = '0' and start = '1') then
					     nstate <= S2;
					 else
					     nstate <= S4;
					 end if;
				when S5 =>
				    if(altb = '1') then
					     nstate <= S6;
					 else
					     nstate <= S7;
				    end if;
				when S6 =>
				    nstate <= S7;
				when S7 =>
				    if(start = '1') then
					     nstate <= S2;
					 else
					     nstate <= S7;
					 end if;
		  end case;
	 end process;
	 
	 
	 -- ds: display, 0 = TM, 1 = SD
    -- entm: increment timer; goes to cen in TM
    -- lsr: goes to load for SD
    -- rstm: reset timer; becomes srst for TM
    -- update: goes to sel for SD multiplexer
	 output_assignment: process(pstate)
	 begin
	     case pstate is
		      when S1 =>
					 update <= '0'; -- resets SD to 99.99
				    lsr <= '1';
					 ds <= '0';
					 entm <= '0';
					 rstm <= '0';
			   when S2 =>
				    rstm <= '1';
			       lsr <= '0';		 -- reset TM to 00.00
					 update <= '0';
					 ds <= '0';
					 entm <= '0';
					 --update <= '1'; -- SD multiplexer back to number
				when S3 =>
				    rstm <= '0';   -- do not reset TM
				    entm <= '1';   -- increment TM
					 ds <= '0';     -- display TM
					 lsr <= '0';
					 update <= '0';
				when S4 =>
				    --entm <= '0';   -- do not increment TM
				    ds <= '0';     -- display TM
					 update <= '0';
					 rstm <= '0';
					 entm <= '0';
					 lsr <= '0';
				when S5 =>
				    lsr <='0';
					 entm <='0';
					 update <= '0';
					 rstm <= '0';
				    ds <= '0';
				when S6 =>
				    update <= '1';
				    lsr <= '1';    -- load TM into SD
					 ds <= '0';
					 entm <= '0';
					 rstm <= '0';
				when S7 =>
				    lsr <= '0';    -- turn load TM into SD off
					 ds <= '1';     -- display SD
					 entm <= '0';
					 rstm <= '0';
					 update <= '0';
		  end case;
	 end process;

end BEHAVIORAL;
