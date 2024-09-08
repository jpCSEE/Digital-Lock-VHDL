set_property BITSTREAM.STARTUP.STARTUPCLK JTAGCLK [current_design]

set_property PACKAGE_PIN U16 [get_ports {z[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {z[0]}]
set_property PACKAGE_PIN V14 [get_ports {z[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {z[1]}]

set_property PACKAGE_PIN T17 [get_ports {btn[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[3]}]
set_property PACKAGE_PIN U18 [get_ports {btn[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[2]}]
set_property PACKAGE_PIN W19 [get_ports {btn[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[1]}]
set_property PACKAGE_PIN T18 [get_ports {btn[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[0]}]

set_property PACKAGE_PIN v17 [get_ports clr]
set_property IOSTANDARD LVCMOS33 [get_ports clr]

set_property PACKAGE_PIN w5 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]