create_clock -name sysclk -period 10 [get_ports clk]
create_generated_clock -name sysclk_50Mhz -div 2 -source [get_ports {clk}] [get_registers {clk_div}]
create_generated_clock -name sclk -source [get_pins {clk_div|d}] [get_ports {sclk}]

# MOSI
set tsu 3
set th 2

set_output_delay -clock sclk -max [ expr $tsu] [get_ports mosi]
set_output_delay -clock sclk -min [ expr - $th ] [get_ports mosi]

# MISO
set tco_max 3
set tco_min 4

set_input_delay -clock sclk -max [ expr $tco_max ] [get_ports miso]
set_input_delay -clock sclk -min [ expr $tco_min ] [get_ports miso]


# CS
set tsu_cs 3
set th_cs 2

set_output_delay -clock sclk -max [ expr $tsu_cs] [get_ports cs]
set_output_delay -clock sclk -min [ expr - $th_cs ] [get_ports cs]
