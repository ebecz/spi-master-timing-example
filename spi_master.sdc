create_clock -name sysclk -period 10 [get_ports clk]

# MOSI
set tsu 3
set th 2

set_output_delay -clock sysclk -max [ expr $tsu] [get_ports mosi] -reference_pin [get_ports sclk]
set_output_delay -clock sysclk -min [ expr - $th ] [get_ports mosi] -reference_pin [get_ports sclk]

# MISO
set tco_max 3
set tco_min 4

set_input_delay -clock sysclk -max [ expr $tco_max ] [get_ports miso] -reference_pin [get_ports sclk]
set_input_delay -clock sysclk -min [ expr $tco_min ] [get_ports miso] -reference_pin [get_ports sclk]


# CS
set tsu_cs 3
set th_cs 2

set_output_delay -clock sysclk -max [ expr $tsu_cs] [get_ports cs] -reference_pin [get_ports sclk]
set_output_delay -clock sysclk -min [ expr - $th_cs ] [get_ports cs] -reference_pin [get_ports sclk]
