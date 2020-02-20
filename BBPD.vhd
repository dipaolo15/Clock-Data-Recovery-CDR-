--Package Declaration
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY BBPD IS
PORT
    (
        Din     	:IN STD_LOGIC;  --clk
        CLK_early   :IN STD_LOGIC;
        CLK_edge    :IN STD_LOGIC;
        CLK_late    :IN STD_LOGIC;

        --outputs
        UP 			:OUT STD_LOGIC;
		DOWN		:OUT STD_LOGIC
    );

END BBPD; 

ARCHITECTURE Behaviour of BBPD IS
	signal Q_early 	:STD_LOGIC;
	signal Q_edge 	:STD_LOGIC;
	signal Q_late 	:STD_LOGIC;
	signal XOR_1 	:STD_LOGIC;
	signal XOR_2	:STD_LOGIC;
	begin
		
		XOR_1 <= Q_edge XOR Q_early;
		XOR_2 <= Q_edge XOR Q_late;
		
		process(CLK_early)begin
			if rising_edge(CLK_early) then
				Q_early <= Din;
			end if;
		end process;
		
		process(CLK_edge)begin
			if rising_edge(CLK_edge) then
				Q_edge <= Din;
			end if;
		end process;
		
		process(CLK_late)begin
			if rising_edge(CLK_late) then
				Q_late 	<= Din;
				UP 		<= XOR_1;
				DOWN	<= XOR_2;
			end if;
		end process;

		
			
		end process

END Behaviour;