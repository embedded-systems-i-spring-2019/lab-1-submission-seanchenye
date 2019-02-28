----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 08:33:06 PM
-- Design Name: 
-- Module Name: debounce - delay_switch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL, IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce is
	port( clk, btn: in std_logic;
      dbnc:     out std_logic;
      cnt:      out std_logic_vector(26 downto 0));
end debounce;

architecture delay_switch of debounce is
signal prev_btn : std_logic := '0';  -- Not the way should be here
signal prev_bnc : std_logic := '0';  -- Not the way should be here

begin

	process (clk)
	variable  DEC_COUNT : integer := 2500000; 
	variable counter : std_logic_vector(26 downto 0);
	--variable counter : integer := 0;
	begin
		

			if(clk' event and clk = '1') then
			
			    if(unsigned(counter) = DEC_COUNT) then
                        counter := (others => '0');
                        cnt <= counter;
                        
                        prev_btn <= btn;
                        prev_bnc <= prev_btn;
                        dbnc <= prev_bnc;
                else
			    dbnc <= prev_bnc;
				if(btn = prev_btn) then
				    --prev_btn <= btn;
					counter := std_logic_vector(unsigned(counter) + 1);
					cnt <= counter;
				else
					counter := (others => '0');
					cnt <= counter;
				end if;
			end if;
		end if;
	end process;	
end delay_switch;
