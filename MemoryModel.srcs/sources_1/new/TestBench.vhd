----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2024 11:36:02 AM
-- Design Name: 
-- Module Name: BitTypedMemory - Behavioral
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
use IEEE.numeric_std.all;


entity TestBench is
    port(
        w_en        : out bit;
        addr        : out bit_vector( 11 downto 0 );
        dataToMem   : out bit_vector( 11 downto 0 );
        dataFromMem1: in bit_vector( 11 downto 0 );
        dataFromMem2: in bit_vector( 11 downto 0 )
    );
end TestBench;

architecture TB_TEST of TestBench is
begin
    
    process
    begin
    
        for i in 0 to 2**12-1 loop
            addr <= to_bitvector(std_logic_vector(to_unsigned(i, 12)));
            dataToMem <= to_bitvector(std_logic_vector(to_unsigned(i, 12)));
            w_en <= '1'; wait for 1ns;
            w_en <= '0'; wait for 1ns;
        end loop;
        
        wait;
    end process;
    
end TB_TEST;