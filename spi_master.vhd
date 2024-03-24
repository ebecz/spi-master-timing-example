
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
  signal clk_div : std_logic;
  signal miso_reg : std_logic;
  signal mosi_reg : std_logic;
begin

  process(clk)
  begin
	if rising_edge(clk) then
		clk_div <= not clk_div;
	end if;
	if rising_edge(clk_div) then
		miso_reg <= miso;
		mosi_reg <= miso_reg;
		cs <= '1';
	end if;
	mosi <= mosi_reg;
	sclk <= clk_div;
  end process;

end rtl;
		