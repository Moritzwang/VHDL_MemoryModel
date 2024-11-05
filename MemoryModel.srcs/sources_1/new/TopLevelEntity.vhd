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
use WORK.all;


entity TLE is
end TLE;

architecture TLE_TEST of TLE is
    component TestBench
        port(
            w_en        : out bit;
            addr        : out bit_vector( 11 downto 0 );
            dataToMem   : out bit_vector( 11 downto 0 );
            dataFromMem1: in bit_vector( 11 downto 0 );
            dataFromMem2: in bit_vector( 11 downto 0 )
        );
    end component;
    
    component RAM4096x12
        port(
            w_en    : in bit;
            addr    : in bit_vector( 11 downto 0 );
            data_in : in bit_vector( 11 downto 0 );
            data_out: out bit_vector( 11 downto 0 )
        );
    end component;
    
    signal sig_w_en         : bit;
    signal sig_addr         : bit_vector( 11 downto 0 );
    signal sig_dataToMem    : bit_vector( 11 downto 0 );
    signal sig_dataFromMem1 : bit_vector( 11 downto 0 );
    signal sig_dataFromMem2 : bit_vector( 11 downto 0 );
begin
    
    TB: TestBench port map(sig_w_en, sig_addr, sig_dataToMem, sig_dataFromMem1, sig_dataFromMem2);
    UUT1: RAM4096x12 port map(sig_w_en, sig_addr, sig_dataToMem, sig_dataFromMem1);
    UUT2: RAM4096x12 port map(sig_w_en, sig_addr, sig_dataToMem, sig_dataFromMem2);
    
end TLE_TEST;


configuration TLE_Config of TLE is
    for TLE_TEST
        for TB: TestBench
            use entity work.TestBench(TB_TEST);
        end for;
        for UUT1: RAM4096x12
            use entity work.RAM4096x12(RAM4096x12_BitTyped);
        end for;
        for UUT2: RAM4096x12
            use entity work.RAM4096x12(RAM4096x12_IntTyped);
        end for;
    end for;
end TLE_Config;
