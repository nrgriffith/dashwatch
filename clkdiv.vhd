--------------------------------------------------------------------------------
-- Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 11.1
--  \   \         Application : 
--  /   /         Filename : xil_2592_39
-- /___/   /\     Timestamp : 11/21/2009 12:12:01
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

entity clkdiv is
   port ( clk    : in    std_logic; 
          rst    : in    std_logic; 
          pps100 : out   std_logic);
end clkdiv;

architecture BEHAVIORAL of clkdiv is

	signal clkcntr: integer range 0 to 499999;
	
begin

	dp: process(clk,rst)
	
	begin
	
		if (rst = '1') then
			clkcntr <= 499999;
			
		elsif (clk'event and clk = '1') then
		
			if (clkcntr > 0) then
				clkcntr <= clkcntr - 1;
				
			else
				clkcntr <= 499999;
				
			end if;
			
		end if;
		
	end process;
	
	pps100 <= '1' when clkcntr = 0 else
	          '0';
				 
end BEHAVIORAL;

