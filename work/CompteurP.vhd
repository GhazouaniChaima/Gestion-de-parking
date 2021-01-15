library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity CompteurP is
	port(clk,reset:in std_logic;
	up,down:in std_logic;
	counte: out std_logic_vector(3 downto 0));
end CompteurP;

architecture arch of CompteurP  is
	signal c: unsigned(3 downto 0);

	begin

	process(clk,reset) 
		begin
		if reset ='1' then
		c<=(others=>'0');

		elsif clk'event and clk='1' then
			if (up='1' and down='0') then 
			 
				c <=c + 1;
		

			elsif (down='1' and up='0') then 
				if(c="0000") then 
					c<="0000";
				else
 					c <= c - 1;
				end if;
			else 
				c<= c ;
			end if;
		end if;

		end process;
	counte<= std_logic_vector(c);
end arch;






