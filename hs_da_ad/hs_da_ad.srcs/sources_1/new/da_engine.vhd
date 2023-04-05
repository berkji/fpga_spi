----------------------------------------------------------------------------------
-- Company: myHome
-- Engineer: Ji Kai
-- 
-- Create Date: 04/01/2023 02:43:17 PM
-- Design Name: 
-- Module Name: hs_da_ad - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- AD/DA Ä£¿é
--https://detail.tmall.com/item.htm?abbucket=6&id=609758835186&rn=6d2faf3952364732e1f944f2eb6c5187&spm=a1z10.5-b-s.w4011-24686329149.54.1f626e99r0Iywt

--requirements:

--DAC part: 
--1. sine wave generation
	
--2. send to DAC
-- generate addr, clk to ROM
-- send data, clk to DAC

--ADC part: 
--1. get data from ADC (seperately)

--2. connect the data to ILA to review
---- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity da_engine is
    Port ( clk : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           rd_data : in STD_LOGIC_VECTOR (7 downto 0);
           rd_addr : out STD_LOGIC_VECTOR (7 downto 0);
           da_clk : out STD_LOGIC;
           da_data : out STD_LOGIC_VECTOR (7 downto 0));
end da_engine;

architecture Behavioral of da_engine is
constant FREQ_ADJ : std_logic_vector(7 downto 0) := "00000000";    -- later change it to integer, the larger value, the slower frequency at the output, range: 0 ~255
signal freq_cnt : std_logic_vector(7 downto 0); 
signal rom_addr : std_logic_vector(7 downto 0) := "00000000";
begin
da_clk <= NOT clk;
da_data <= rd_data;
rd_addr <= rom_addr;

addr_gen: process(clk, rst_n)
begin

if (rising_edge(clk)) then
   if (rst_n = '0') then 
       rom_addr <= (others => '0');
   elsif (freq_cnt = FREQ_ADJ) then
       rom_addr <= rom_addr + 1;
   end if;
end if;
end process;

freqcnt_gen: process(clk,rst_n)
begin
if (rising_edge(clk)) then
   if (rst_n = '0') then 
       freq_cnt <= (others => '0');
   elsif (freq_cnt = FREQ_ADJ) then 
       freq_cnt <= (others => '0');
   else
       freq_cnt <= freq_cnt + 1; 
   end if;
end if;
end process;


end Behavioral;
