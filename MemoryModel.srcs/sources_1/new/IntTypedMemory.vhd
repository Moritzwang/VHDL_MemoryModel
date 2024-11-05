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


entity RAM4096x12 is
    port(
        w_en    : in bit;
        addr    : in bit_vector( 11 downto 0 );
        data_in : in bit_vector( 11 downto 0 );
        data_out: out bit_vector( 11 downto 0 )
    );
end RAM4096x12;

architecture RAM4096x12_IntTyped of RAM4096x12 is
begin
    
    process(w_en, addr, data_in)
        type IntMem is array (natural range 0 to (2**12)-1) of bit_vector( 11 downto 0 );
        variable mem : IntMem;
        variable index : natural;
    begin
        
        index := to_integer(unsigned(to_stdlogicvector(addr)));
        
        if w_en = '1' then
            mem(index) := data_in;
        end if;
        
        data_out <= mem(index);
        
    end process;
    
end RAM4096x12_IntTyped;
