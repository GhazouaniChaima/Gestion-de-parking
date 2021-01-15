library ieee;
use ieee.std_logic_1164.all;

entity registreP is
	port(d_in:in std_logic_vector(3 downto 0);
	load,reset,clk :in std_logic;
	d_out :out std_logic_vector(3 downto 0));
end registreP;

architecture comport of registreP is 

begin 
	process(reset,clk)
	begin 
	
	if(reset='1')then 
	d_out <= (others => '0');
	
	elsif (clk' event and clk ='1') then
		if (load='1') then
			d_out <= d_in;
		else 
			d_out <= (others => '0');
		end if;
	
	end if;

	end process;
end comport;
