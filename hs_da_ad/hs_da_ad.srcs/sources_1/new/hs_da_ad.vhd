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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hs_da_ad is
    Port ( sys_clk : in STD_LOGIC;
           sys_rst_n : in STD_LOGIC; 
           sysclk_locked : out std_logic; 
           da_clk : out STD_LOGIC;
           da_data : out STD_LOGIC_VECTOR (7 downto 0);
           ad_data : in STD_LOGIC_VECTOR (7 downto 0);
           ad_otr : in STD_LOGIC_vector(0 downto 0);
           ad_clk : out STD_LOGIC;
		   txtrig : in STD_LOGIC;
		   spi_clk : out STD_LOGIC;
		   mosi : out std_logic;
		   latch : out std_logic;
		   miso : in std_logic);
		   
end hs_da_ad;

architecture Behavioral of hs_da_ad is

signal rd_addr : std_logic_vector(7 downto 0);
signal rd_data : std_logic_vector(7 downto 0);
signal clk_50 : std_logic;

component rom_256x8b
port (
    clka : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
end component;

component da_engine
port (
           clk : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           rd_data : in STD_LOGIC_VECTOR (7 downto 0);
           rd_addr : out STD_LOGIC_VECTOR (7 downto 0);
           da_clk : out STD_LOGIC;
           da_data : out STD_LOGIC_VECTOR (7 downto 0)
);
end component;

component ad_engine
port (
           clk : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           ad_data : in STD_LOGIC_VECTOR (7 downto 0);
           ad_otr : in STD_LOGIC_vector(0 downto 0);
           ad_clk_engine : out STD_LOGIC
);
end component;
signal ad_clk_i : std_logic := '0';

component ila_0 
PORT (
clk : IN STD_LOGIC;
probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
probe1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
);
end component;

component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  clk_50          : out    std_logic;
  -- Status and control signals
  resetn             : in     std_logic;
  locked            : out    std_logic;
  sys_clk           : in     std_logic
 );
end component;


component spi_engine
    Port 
    (   
    clk50 : in STD_LOGIC;
        rst_n : in STD_LOGIC;
        txtrig : in STD_LOGIC;
        rd_data : in STD_LOGIC_VECTOR (7 downto 0);
        rd_addr : out STD_LOGIC_VECTOR (7 downto 0);
        spi_clk : out STD_LOGIC;
        mosi : out STD_LOGIC;
        latch : out std_logic;
        miso : in STD_LOGIC);
end component;


begin

ad_clk <= ad_clk_i;

clk_0: clk_wiz_0
port map (
clk_50 => clk_50,
resetn => sys_rst_n,
locked => sysclk_locked,
sys_clk => sys_clk
);

rom_sine: rom_256x8b
port map (
   clka => clk_50, 
   addra => rd_addr,
   douta => rd_data
);

-- da_1 : da_engine
-- port map (
    -- clk => clk_50,
    -- rst_n => sys_rst_n,
    -- rd_data => rd_data,
    -- rd_addr => rd_addr,
    -- da_clk => da_clk,
    -- da_data => da_data
-- );

-- ad_1 : ad_engine
-- port map (
    -- clk => clk_50,
    -- rst_n => sys_rst_n,
    -- ad_data => ad_data,
    -- ad_otr => ad_otr,
    -- ad_clk_engine => ad_clk_i
-- );

-- ila_1: ila_0
-- port map (
   -- clk =>    ad_clk_i,
   -- probe0 => ad_otr,
   -- probe1=>  ad_data
-- );


spi_1 : spi_engine
port map (
    clk50 => clk_50,
	rst_n => sys_rst_n,
	txtrig => txtrig,
	rd_data => rd_data,
	rd_addr => rd_addr,
	spi_clk => spi_clk,
	mosi => mosi,
	latch => latch,
	miso => miso
	);
end Behavioral;
