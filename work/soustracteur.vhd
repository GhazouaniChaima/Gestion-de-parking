library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity soustracteur is
	port(
	A,B:in std_logic_vector(3 downto 0);
	nb_places_dispos: out std_logic_vector(3 downto 0));
end soustracteur;

architecture arch of soustracteur is
	--signal c: std_logic;
	begin
	
		nb_places_dispos <= "0000" when (A>=B) else std_logic_vector(unsigned(B)-unsigned(A)) ;	

end arch;






