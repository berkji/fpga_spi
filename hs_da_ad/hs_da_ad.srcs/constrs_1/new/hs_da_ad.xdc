set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN E3} [get_ports sys_clk]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN C2} [get_ports sys_rst_n]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN G13} [get_ports {da_data[7]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN B11} [get_ports {da_data[6]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN A11} [get_ports {da_data[5]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN D12} [get_ports {da_data[4]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN D13} [get_ports {da_data[3]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN B18} [get_ports {da_data[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN A18} [get_ports {da_data[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K16} [get_ports {da_data[0]}]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U12} [get_ports da_clk]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN E15} [get_ports {ad_data[7]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN E16} [get_ports {ad_data[6]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN D15} [get_ports {ad_data[5]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN C15} [get_ports {ad_data[4]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J17} [get_ports {ad_data[3]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J18} [get_ports {ad_data[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K15} [get_ports {ad_data[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J15} [get_ports {ad_data[0]}]

##JC1
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V12} [get_ports ad_clk]        
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V10} [get_ports ad_otr]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V11} [get_ports sysclk_locked]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U14} [get_ports txtrig]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V14} [get_ports spi_clk]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T13} [get_ports mosi]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U13} [get_ports latch]

##JD1
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN D4} [get_ports miso]   


#create_generated_clock -name ad_1/ad_clk_i_reg/Q -source [get_pins clk_0/sys_clk] -divide_by 2 [get_pins ad_1/ad_clk_i_reg/Q]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets ad_clk_OBUF]
