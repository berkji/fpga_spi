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
	--generate sine wave
--2. send to DAC


--ADC part: 
--1. get data from ADC (seperately)

--2. connect the data to ILA to review

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

entity rom_256x8b is
    Port ( clka : in STD_LOGIC;
           addra : in STD_LOGIC_VECTOR (7 downto 0);
           douta : out STD_LOGIC_VECTOR (7 downto 0);
           sys_rst : in STD_LOGIC);
end rom_256x8b;

architecture Behavioral of rom_256x8b is

begin


end Behavioral;
