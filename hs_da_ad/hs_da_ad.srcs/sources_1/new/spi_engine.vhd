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


--SPI part
--1. send data on SPI bus 

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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spi_engine is
    Port ( clk50 : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           txtrig : in STD_LOGIC;
           rd_data : in STD_LOGIC_VECTOR (7 downto 0);
           rd_addr : out STD_LOGIC_VECTOR (7 downto 0);
           spi_clk : out STD_LOGIC;
           mosi : out STD_LOGIC;
		   latch : out std_logic;
           miso : in STD_LOGIC);
end spi_engine;

architecture Behavioral of spi_engine is
constant FREQ_ADJ : std_logic_vector(7 downto 0) := "00000000";    -- later change it to integer, the larger value, the slower frequency at the output, range: 0 ~255
constant SPI_DIVIDER: std_logic_vector(3 downto 0) := "0010";
signal freq_cnt : std_logic_vector(7 downto 0); 
signal rom_addr : std_logic_vector(7 downto 0) := "00000000";

type SPI_CONTROL_STATE is (WAIT_FOR_TRIG,LOAD_DAT,SPI_TX_EN, SPI_TX_DONE, LATCH_ON);  
signal spi_control : SPI_CONTROL_STATE := WAIT_FOR_TRIG;
signal spi_clk_i : std_logic;
signal divider : std_logic_vector(3 downto 0) :="0000";
signal spi_mosi_i : std_logic;
signal spi_data_i : std_logic_vector(7 downto 0);
signal trig_falling_edge: std_logic_vector(1 downto 0) := "00";
signal spi_tx_length : integer range 0 to 7;
signal latch_i    : std_logic := '0';    -- '1' means latch has sent
signal trig_level : std_logic :='1';
signal trig_level_d : std_logic :='1';

begin

rd_addr <= rom_addr;

trig_det: process(clk50, rst_n, txtrig)
begin
if (rising_edge(clk50)) then
   if (rst_n ='0') then
      trig_level <= '1';
      trig_level_d <='1';
   else
      trig_level <= txtrig;
      trig_level_d <= trig_level;
   end if;
end if;
end process;

trig_falling_edge <= trig_level & trig_level_d;
latch <= latch_i;
mosi <= spi_mosi_i;
spi_clk <= spi_clk_i when (spi_control = SPI_TX_EN) else '0';	

spi_control_1:process(clk50, rst_n)
begin
if (rising_edge(clk50)) then
    if (rst_n = '0') then
       spi_control<= WAIT_FOR_TRIG;
	   rom_addr <="00000000";
    else
       case (spi_control) IS
        when WAIT_FOR_TRIG =>
          if (trig_falling_edge = "10") then
             spi_control <= LOAD_DAT;
          end if;
        when LOAD_DAT =>
          spi_control <= SPI_TX_EN;
		  rom_addr <= rom_addr + 1;
        when SPI_TX_EN =>
          if spi_tx_length = "1000" then
             spi_control <= SPI_TX_DONE;
          end if;
        when SPI_TX_DONE =>
          spi_control <= LATCH_ON;
        when LATCH_ON =>
          if latch_i = '1' then
             spi_control <= WAIT_FOR_TRIG;
          end if;
        end case;
     end if;
end if;
end process;

spi_clk_gen: process(clk50, rst_n)
begin

if (rising_edge(clk50)) then
    if (rst_n = '0') then
	    spi_clk_i <= '0';
		divider <="0000";
	else 
	    if (divider < SPI_DIVIDER) then
			divider <= divider + 1;
		else	
			spi_clk_i <= NOT spi_clk_i;
			divider <= "0000";
		end if;
	end if;
end if;

end process;


spi_tx_1 : process(spi_clk_i, rst_n)
begin

if (rising_edge(spi_clk_i)) then
	if (rst_n = '0') then
		spi_mosi_i <= '0';
	elsif (spi_control = WAIT_FOR_TRIG) then
		spi_tx_length <= 0;
	elsif (spi_control = SPI_TX_EN) then
		spi_mosi_i <= spi_data_i(spi_tx_length);
		spi_tx_length <= spi_tx_length + 1;
	end if;
end if;
end process;


spi_load_data_1 : process(clk50, rst_n)
begin
if (rising_edge(clk50)) then
    if (rst_n = '0') then
		spi_data_i <= (others =>'0');
	elsif (spi_control = LOAD_DAT) then
		spi_data_i <= rd_data;
	end if;
end if;
end process;

spi_latch_1: process(clk50, rst_n) 
begin
if (rising_edge(clk50)) then
  if (rst_n = '0') then
    latch_i <= '0';
  elsif (spi_control = WAIT_FOR_TRIG) then
    latch_i <= '0';
  elsif (spi_control = LATCH_ON) then
    latch_i <= '1';
  end if;
end if;

end process;

end Behavioral;




