--Package Declaration
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY DIGITAL_FILTER IS
PORT
    (
		clk		:IN STD_LOGIC;
		In_P	:IN STD_LOGIC;
		In_N	:IN STD_LOGIC;
		
       --outputs
	   Out_P	:OUT STD_LOGIC;
	   Out_N	:OUT STD_LOGIC
    );

END DIGITAL_FILTER; 

ARCHITECTURE Behaviour of  DIGITAL_FILTER IS
signal P_NOR	:STD_LOGIC;
signal N_NOR	:STD_LOGIC;
signal P_reg	:STD_LOGIC_VECTOR(3 downto 0);
signal N_reg	:STD_LOGIC_VECTOR(3 downto 0);

	begin
	
		process(clk) begin
			if rising_edge(clk) then
				P_reg <= In_P & P_reg(3 downto 1);
				N_reg <= In_N & N_reg(3 downto 1);
				
			end if;
		end process;	
		
		process(P_reg, N_reg)begin
			if P_reg = "0000" then
				P_NOR <= '1';
			else 
				P_NOR <= '0';
			end if;
			
			if N_reg = "0000" then
				N_NOR <= '1';
			else 
				N_NOR <= '0';
			end if;
		end process;
			
			
		process(P_NOR, N_NOR) begin
			
			if P_NOR = '1' AND N_NOR = '0' then
				Out_P <= '1';
				Out_N <= '0';
				
			elsif N_NOR = '1' AND P_NOR = '0' then
				Out_N <= '1';
				Out_P <= '0';
			else
				Out_P <= '0';
				Out_N <= '0';
			end if;
		end process;
END Behaviour;