--------------------------------------------------------------------------------
-- Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 11.1
--  \   \         Application : 
--  /   /         Filename : xil_2592_40
-- /___/   /\     Timestamp : 11/21/2009 12:18:50
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

entity SD is
   port ( clk    : in    std_logic; 
          D      : in    std_logic_vector (15 downto 0); -- New number
          load   : in    std_logic; --  lsr
          pps100 : in    std_logic; 
          reset  : in    std_logic; 
          sdout  : out   std_logic_vector (15 downto 0));
end SD;

architecture BEHAVIORAL of SD is

signal store : std_logic_vector (15 downto 0);

begin
	 
    compare: process(clk, pps100, load, reset)
	 begin
	     if(reset = '1') then
	         store <= "1001100110011001";
	     elsif(clk'event and clk = '1' and pps100 = '1' and load = '1') then
            store <= D;
	     end if;
	     sdout <= store;
	 end process;

end BEHAVIORAL;
