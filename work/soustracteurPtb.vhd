library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity soustracteurPtb is 
end soustracteurPtb;

architecture archtest of soustracteurPtb is
	
component soustracteur 
	port(
	A,B:in std_logic_vector(3 downto 0);
	nb_places_dispos: out std_logic_vector(3 downto 0));
end component;


	signal tA,tB:std_logic_vector(3 downto 0);
	signal tnb_places_dispos: std_logic_vector(3 downto 0);
	begin
	Mapcompt:soustracteur port map(tA,tB,tnb_places_dispos);
	    
			
		    tA <= "0101", "0011" after 20 ns, "1111" after 40 ns;
		    tB <= "0101","1011" after 20 ns, "0011" after 40 ns ;
	      
	    
end archtest;
