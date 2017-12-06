--------------------------------------------------------------------------------
-- Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 11.1
--  \   \         Application : 
--  /   /         Filename : xil_3364_20
-- /___/   /\     Timestamp : 11/21/2009 16:50:14
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

entity C9999 is
   port (en : in    std_logic;
	       C : out   std_logic_vector (15 downto 0));
end C9999;

architecture BEHAVIORAL of C9999 is
begin

	C <= "1001100110011001" when en = '1' else
	     "0000000000000000";
	
end BEHAVIORAL;

