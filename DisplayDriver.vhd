--------------------------------------------------------------------------------
-- Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 13.2
--  \   \         Application : 
--  /   /         Filename : xil_4136_21
-- /___/   /\     Timestamp : 11/15/2011 14:39:43
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;

entity DisplayDriver is
   port ( clk       : in    std_logic; 
          reset     : in    std_logic; 
          segsd0    : in    std_logic_vector (6 downto 0); 
          segsd1    : in    std_logic_vector (6 downto 0); 
          segsd2    : in    std_logic_vector (6 downto 0); 
          segsd3    : in    std_logic_vector (6 downto 0); 
          Digit0    : out   std_logic; 
          Digit1    : out   std_logic; 
          Digit2    : out   std_logic; 
          Digit3    : out   std_logic; 
          Segsout   : out   std_logic_vector (7 downto 0));
end DisplayDriver;

architecture BEHAVIORAL of DisplayDriver is

	Signal cntr: std_logic_vector(1 downto 0);
	signal clkcntr: integer range 0 to 99999;
	Signal pps1000: std_logic;
	
begin

	dp: process(clk,reset)
	
	begin
		if (reset = '1') then
			clkcntr <= 99999;
		elsif (clk'event and clk = '1') then
			if (clkcntr > 0) then
				clkcntr <= clkcntr - 1;
			else
				clkcntr <= 99999;
			end if;
		end if;
	end process;
	
	pps1000 <= '1' when clkcntr = 0 else '0';

	cp: process(clk)
	
	begin
		if (clk'event and clk = '1') then
			if (pps1000 = '1') then
				if (reset = '1') then
					cntr <= "00";
				else
					cntr <= cntr + "01";
				end if;
			end if;
		end if;
	end process;
	
	Digit0 <= '1' when cntr = "00" and reset = '0' else '0';
	Digit1 <= '1' when cntr = "01" and reset = '0' else '0';
	Digit2 <= '1' when cntr = "10" and reset = '0' else '0';
	Digit3 <= '1' when cntr = "11" and reset = '0' else '0';
				
	Segsout <= not ('0' & segsd0) when cntr = "00" else
	           not ('0' & segsd1) when cntr = "01" else
				  not ('1' & segsd2) when cntr = "10" else
				  not ('0' & segsd3);

end BEHAVIORAL;

