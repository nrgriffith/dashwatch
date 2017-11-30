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

signal cnt0,cnt1,cnt2,cnt3 : std_logic_vector(3 downto 0);

begin

    count: process(clk, pps100, srst)
	 begin
	     if(srst = '1') then
		      cnt0 <= "0000";
				cnt1 <= "0000";
				cnt2 <= "0000";
				cnt3 <= "0000";
        elsif(clk'event and clk='1' and pps100 = '1' and cen = '1') then
		      if (cnt0 < "1001") then
				    cnt0 <= cnt0 + "0001";
			   elsif (cnt1 < "1001") then
				    cnt0 <= "0000";
					 cnt1 <= cnt1 + "0001";
			   elsif (cnt2 < "1001") then
				    cnt0 <= "0000";
					 cnt1 <= "0000";
					 cnt2 <= cnt2 + "0001";
				elsif (cnt3 < "1001") then
				    cnt0 <= "0000";
					 cnt1 <= "0000";
					 cnt2 <= "0000";
					 cnt3 <= cnt3 + "0001";
			   end if;
        end if;
		  tmout <= cnt3 & cnt2 & cnt1 & cnt0;
	 end process;

end BEHAVIORAL;

