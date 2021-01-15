library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comparateur is
	port(
	A,B:in std_logic_vector(3 downto 0);
	sup_egal: out std_logic);
end comparateur;

architecture arch of comparateur is
	
	begin
		sup_egal<= '1'when (A>=B) else '0';	

end arch;






