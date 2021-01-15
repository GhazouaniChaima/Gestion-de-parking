
library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity comparateurPtb is 
end comparateurPtb;

architecture archtest of comparateurPtb is
	
component comparateur 
	port(
	A,B:in std_logic_vector(3 downto 0);
	sup_egal: out std_logic);
end component;

	signal tA,tB:std_logic_vector(3 downto 0);
	signal tsup_egal: std_logic;
	begin
	Mapcompt:comparateur port map(tA,tB,tsup_egal);
	    
			
		    tA <= "0011","0111" after 20 ns,"0011" after  40 ns;
		    tB <= "0111","0010" after 20 ns,"0011" after 40 ns;
    
end archtest;
