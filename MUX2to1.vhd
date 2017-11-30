--------------------------------------------------------------------------------
-- Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 11.1
--  \   \         Application : 
--  /   /         Filename : xil_2592_38
-- /___/   /\     Timestamp : 11/21/2009 12:08:28
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

entity MUX2to1 is
   port ( I0  : in    std_logic_vector (15 downto 0); 
          I1  : in    std_logic_vector (15 downto 0); 
          sel : in    std_logic; 
          Y   : out   std_logic_vector (15 downto 0));
end MUX2to1;

architecture BEHAVIORAL of MUX2to1 is

begin

    multiplexer: process(sel, I0, I1)
	 begin
	     if (sel = '0') then
		      Y <= I0;
		  else
		      Y <= I1;
		  end if;
	 end process;

end BEHAVIORAL;


