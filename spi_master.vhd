
library ieee;
use ieee.std_logic_1164.all;

entity spi_master is
  port
    (
		clk : in std_logic;
		mosi : out std_logic := '0';
		miso : in std_logic;
		sclk : out std_logic := '0';
		cs : out std_logic := '0'
	);
end spi_master;

architecture rtl of spi_master is
begin

  process(clk)
  begin
	if rising_edge(clk) then
		mosi <= miso;
		cs <= '1';
	end if;
	sclk <= clk;
  end process;

end rtl;
		