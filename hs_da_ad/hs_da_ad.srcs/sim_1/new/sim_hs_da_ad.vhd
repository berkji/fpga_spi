----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2023 09:21:25 PM
-- Design Name: 
-- Module Name: sim_hs_da_ad - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_hs_da_ad is
--  Port ( );
end sim_hs_da_ad;

architecture Behavioral of sim_hs_da_ad is
component hs_da_ad is
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
end component hs_da_ad;

signal sys_clk : std_logic :='0';
signal sys_rst_n : std_logic;
signal sysclk_locked : std_logic;
signal da_clk : std_logic;
signal da_data : STD_LOGIC_VECTOR (7 downto 0);
signal ad_data : STD_LOGIC_VECTOR (7 downto 0);
signal ad_otr : STD_LOGIC_vector(0 downto 0);
signal ad_clk : STD_LOGIC;
signal txtrig_i : std_logic;
signal spi_clk : std_logic;
signal mosi : std_logic;
signal latch : std_logic;
signal miso : std_logic;

constant PERIOD : time := 20ns;
constant TRIGPERIOD: time := 100ns;


begin

hs_1 : hs_da_ad
port map (
    sys_clk => sys_clk,
    sys_rst_n => sys_rst_n,
    sysclk_locked => sysclk_locked,
    da_clk => da_clk,
    da_data => da_data,
    ad_data => ad_data,
    ad_otr => ad_otr,
    ad_clk => ad_clk,
	txtrig => txtrig_i,
	spi_clk => spi_clk,
	mosi => mosi,
	latch => latch,
	miso => miso
);

clkgen_1 : process
begin
    sys_clk <= '0';
    wait for PERIOD/2;
    sys_clk <= '1';
    wait for PERIOD/2;
end process;

sysrst_1 : process
begin
    sys_rst_n <= '0';
    wait for 10*PERIOD;
    sys_rst_n <= '1';
    wait;
end process;

txtrig_1 : process
begin
	txtrig_i <='1';
	wait for 10*TRIGPERIOD;

	txtrig_i <='0';
	wait for TRIGPERIOD;
	txtrig_i <='1';
	wait for 30*TRIGPERIOD;
	
	txtrig_i <='0';
	wait for TRIGPERIOD;
	txtrig_i <='1';
	wait for 30*TRIGPERIOD;

	txtrig_i <='0';
	wait for TRIGPERIOD;
	txtrig_i <='1';
	wait for 30*TRIGPERIOD;

	txtrig_i <='0';
	wait for TRIGPERIOD;
	txtrig_i <='1';
	wait for 30*TRIGPERIOD;
	
end process;


end Behavioral;
