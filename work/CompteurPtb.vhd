library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity CompteurPtb is 
end CompteurPtb;

architecture archtest of CompteurPtb is
component CompteurP 
	port(clk,reset:in std_logic;
	up,down:in std_logic;
	counte: out std_logic_vector(3 downto 0));
end component;
	signal tclk,treset,tup,tdown:std_logic;
	signal c: std_logic_vector(3 downto 0);
begin
	UUT:CompteurP port map(tclk,treset,tup,tdown,c);
	     treset <= '1','0' after 20 ns;
	  
		process
		    begin
		    tclk <= '1','0' after 10 ns;
				wait for 20 ns;
	  end process;
   		process
			begin
			tup<= '0','1' after 20 ns;
			wait for 40 ns;
		END process;
		process
			begin
			tdown<= '0','1' after 40 ns;
			wait for 80 ns;
		END process;

   --up   : 0 20ns 1 40ns 0 60ns 1 80ns 
	 --down : 0 20ns 0 40ns 1 60 ns 1 80 ns

end archtest;
