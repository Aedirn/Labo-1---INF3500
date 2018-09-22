----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.09.2018 18:23:13
-- Design Name: 
-- Module Name: multi_tb - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
use ieee.Std_Logic_Arith.all; 
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multi_tb is
end multi_tb;

architecture Behavioral of multi_tb is

Signal A,B: std_logic_vector (2 downto 0);
Signal Output : std_logic_vector(5 downto 0);

begin

	UUT: entity work.multi
		port map (
			A =>A,
			B=>B,
			Output=>Output
		);
     process
     begin
     for i in 0 to 7 loop
        A<=conv_std_logic_vector(i,3);
        for j in 0 to 7 loop
            B<=conv_std_logic_vector(j,3);
            wait for 10 ns;
        end loop;
     end loop;

     report "simulation terminée" severity failure; 
     
     
    end process;
end Behavioral;
