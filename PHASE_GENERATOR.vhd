--Package Declaration
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY PHASE_GENERATOR IS
PORT
    (

        --inputs
        ref_clk 		        :IN STD_LOGIC; --phase generator reference clock
        rst                 :IN STD_LOGIC; --reset phase generator
        --outputs
         parallel_data_out  :OUT STD_LOGIC_VECTOR(7 downto 0) --10 bit register counter

    );

END PHASE_GENERATOR; 

ARCHITECTURE Behaviour of PHASE_GENERATOR IS

begin

    input_xor_1 <= Q(6);
    input_xor_2 <= Q(9);
    output_xor <= input_xor_1 XOR input_xor_2;

    process(clk,rst)
    begin
        if(rst = '1') then
            parallel_data_out <= "00000000";
        elsif falling_edge(clk) then 
            parallel_data_out <= parallel_data_out(6 downto 0) & parallel_data_out(7); --shift register
        end if;
    end process;

END Behaviour;