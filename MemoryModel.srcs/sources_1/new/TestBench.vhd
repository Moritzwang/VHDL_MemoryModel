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
    -- DUT 端口信号声明
    signal w_en        : bit;
    signal addr        : bit_vector(11 downto 0);
    signal dataToMem   : bit_vector(11 downto 0);
    signal dataFromMem : bit_vector(11 downto 0);

    -- 组件声明（DUT 实体声明）
    component RAM4096x12
        port(
            w_en    : in bit;
            addr    : in bit_vector(11 downto 0);
            data_in : in bit_vector(11 downto 0);
            data_out: out bit_vector(11 downto 0)
        );
    end component;

begin
    -- 实例化 DUT 并连接端口
    UUT: RAM4096x12
        port map(
            w_en => w_en,
            addr => addr,
            data_in => dataToMem,
            data_out => dataFromMem
        );

    process
        variable i : integer := 0;
    begin
        w_en <= '1';
        for i in 0 to 4095 loop
            addr <= std_logic_vector(to_unsigned(i, 12));
            dataToMem <= std_logic_vector(to_unsigned(i, 12));
            wait for 10 ns;
        end loop;

        w_en <= '0';
        for i in 0 to 4095 loop
            addr <= std_logic_vector(to_unsigned(i, 12));
            wait for 10 ns;
        end loop;
        
        wait;
    end process;
    
end TB_TEST;
