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


entity RAM4096x12 is
    port(
        w_en    : in bit;
        addr    : in bit_vector(11 downto 0);
        data_in : in bit_vector(11 downto 0);
        data_out: out bit_vector(11 downto 0)
    );
end RAM4096x12;

architecture RAM4096x12_BitTyped of RAM4096x12 is
    type mem_type is array(0 to 4095) of bit_vector(11 downto 0);
begin
    process(w_en, addr, data_in)
    begin
        if w_en = '1' then
            memory(to_integer(unsigned(addr))) <= data_in;
        end if;
        data_out <= memory(to_integer(unsigned(addr)));
    end process;
end RAM4096x12_BitTyped;
