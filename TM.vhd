--------------------------------------------------------------------------------
-- Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 11.1
--  \   \         Application : 
--  /   /         Filename : xil_5964_20
-- /___/   /\     Timestamp : 11/21/2009 12:34:57
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

entity TM is
   port ( clk    : in    std_logic; 
          cen    : in    std_logic;  -- entm
          pps100 : in    std_logic;
          srst   : in    std_logic;  -- rstm 
          tmout  : out   std_logic_vector (15 downto 0));
end TM;

architecture BEHAVIORAL of TM is

signal cnt : std_logic_vector(15 downto 0);

begin

    count: process(pps100, srst)
	 begin
	     if(srst = '1') then
		      cnt <= "0000000000000000";
        elsif(pps100'event and pps100 = '1' and cen = '1') then
		      if (cnt < "1001100110011001") then
				    cnt <= cnt + "0000000000000001";
				else
				    cnt <= "0000000000000000";
				end if;
        end if;
		  tmout <= cnt;
	 end process;

end BEHAVIORAL;

