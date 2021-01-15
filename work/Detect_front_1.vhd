library ieee;
use ieee.std_logic_1164.all;

entity Detect_front_1 is
	port(reset,clk,e:in std_logic;
	ft_mt:out std_logic);
end Detect_front_1;

architecture comport of Detect_front_1 is 
type state_type is (etat0,etat1,etat2);
signal etat_courant,etat_suivant:state_type;

begin 
	process(etat_courant,e)
	begin 	
		case etat_courant is 
			when etat0 => ft_mt <= '0';	
					if(e='1') then etat_suivant<= etat1;
					else etat_suivant <= etat0;
					end if;
			when etat1 => ft_mt <= '1';	
					etat_suivant<= etat2;
			when etat2 => ft_mt <= '0';	
					if(e='0') then etat_suivant<= etat0;
					else etat_suivant <= etat2;
					end if;
		end case;		
	end process;

	process(clk,reset)
	begin
		if (clk'event and clk='1') then 
			if reset='1' then
					etat_courant<= etat0;
			else	
					etat_courant <=etat_suivant;
			end if;
		end if;
	end process;

end comport;
