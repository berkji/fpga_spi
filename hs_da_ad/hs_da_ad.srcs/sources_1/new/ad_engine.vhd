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


--ADC part: 
--1. get data from ADC (seperately)
-- generate clock to ADC
--2. connect the data to ILA to review
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ad_engine is
    Port ( clk : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           ad_data : in STD_LOGIC_VECTOR (7 downto 0);
           ad_otr : in STD_LOGIC_vector(0 downto 0);
           ad_clk_engine : out STD_LOGIC);
end ad_engine;

architecture Behavioral of ad_engine is
signal ad_clk_i : std_logic :='0';
begin

ad_clk_engine <= ad_clk_i;

ad_clk_gen: process(clk,rst_n)
begin
    if (rising_edge(clk)) then
       if (rst_n = '0') then
          ad_clk_i <= '0';
       else
          ad_clk_i <= NOT ad_clk_i;
       end if;
     end if;
  
end process;

end Behavioral;
