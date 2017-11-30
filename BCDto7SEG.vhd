--------------------------------------------------------------------------------
-- Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 11.1
--  \   \         Application : 
--  /   /         Filename : xil_3236_20
-- /___/   /\     Timestamp : 11/21/2009 11:54:07
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

entity BCDto7SEG is
   port ( BCD  : in    std_logic_vector (3 downto 0); 
          SEGS : out   std_logic_vector (6 downto 0));
end BCDto7SEG;

architecture BEHAVIORAL of BCDto7SEG is

begin

    -- Key
	 --
    --  --      0
	 -- |  |   5   1
	 --  --      6
	 -- |  |   4   2
	 --  --      3

        with BCD select SEGS <= "0111111" when "0000", -- 0
	                             "0000110" when "0001", -- 1
				    					  "1011011" when "0010", -- 2
					    				  "1001111" when "0011", -- 3
						    			  "1100110" when "0100", -- 4
							        	  "1101101" when "0101", -- 5
									     "1111101" when "0110", -- 6
									     "0000111" when "0111", -- 7
									     "1111111" when "1000", -- 8
									     "1101111" when "1001", -- 9
	                             "1000000" when others; -- error


end BEHAVIORAL;
