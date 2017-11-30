--------------------------------------------------------------------------------
-- Copyright (c) 1995-2009 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 11.1
--  \   \         Application : 
--  /   /         Filename : xil_3364_21
-- /___/   /\     Timestamp : 11/21/2009 16:55:24
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

entity CMP16 is
   port ( A    : in    std_logic_vector (15 downto 0); 
          B    : in    std_logic_vector (15 downto 0); 
          altb : out   std_logic);
end CMP16;

architecture BEHAVIORAL of CMP16 is

begin

  -- this is comparing the TM (A) and SD storage (B)
  -- A < B: ALTB = 1
  -- A >= B: ALTB = 0
  
  comparison: process(A, B)
  begin
  
      if(A < B) then
		    altb <= '1';
		else
		    altb <= '0';
		end if;
  end process;
  

end BEHAVIORAL;

