library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity registrePtb is 
end registrePtb;


architecture comport of registrePtb is 
component registreP
	port(d_in:in std_logic_vector(3 downto 0);
	load,reset,clk :in std_logic;
	d_out :out std_logic_vector(3 downto 0));
end component;
signal td_in,td_out :std_logic_vector(3 downto 0);
signal tload,treset,tclk: std_logic;

begin
UUT: registreP port map(td_in,tload,treset,tclk,td_out);

	Ps1:process
 	begin
		tclk<='0', '1' after 10 ns;
		wait for 20 ns;
	end process;
	
	treset<='1','0' after 20 ns;
		
	tload<= '0', '1' after 20 ns;
		
	td_in<= "0011","0000" after 60 ns;
	   
	assert not(td_in="0000") report "le nombre sup a 0" severity NOTE;  	

end comport;
