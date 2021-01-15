
library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity ParkingPtb is 
end ParkingPtb;

architecture archtest of ParkingPtb is


component Parking 
	port(clk,reset,Id_reg,capt_entree,capt_sortie:in std_logic;
	Nb_max:in std_logic_vector(3 downto 0);
	nb_palces_dispos: out std_logic_vector(3 downto 0);
	complet : out std_logic);
end component;


	signal tclk,treset,tId_reg,tcapt_entree,tcapt_sortie,tcomplet:std_logic;
	signal tNb_max, tnb_palces_dispos: std_logic_vector(3 downto 0);
	
	
begin
	UUT:Parking port map(tclk,treset,tId_reg,tcapt_entree,tcapt_sortie,tNb_max,tnb_palces_dispos,tcomplet);
	    
		treset <= '1','0' after 20 ns;
	  
		process
		    begin
		    tclk <= '1','0' after 10 ns;
				wait for 20 ns;
	  end process;
   
		tId_reg<= '1';
		tNb_max<= "0011", "0111" after 320 ns ;
		
		process
			begin
				tcapt_entree <= '0','1' after 30 ns;
			wait for 60 ns;
		END process;

			process
			begin
				tcapt_sortie <= '0','1' after 80 ns;
			wait for 160 ns;
		END process;

--tcapt_entree : '0' 40ns '1' 80 ns '0' 120 ns '1' 160 ns
--tcapt_sortie : '0' 									80 ns '1' 									 	160 ns 

end archtest;
