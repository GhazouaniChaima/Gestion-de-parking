library ieee;
use ieee.std_logic_1164.all;

entity Parking is
	port(clk,reset,Id_reg,capt_entree,capt_sortie:in std_logic;
	Nb_max:in std_logic_vector(3 downto 0);
	nb_palces_dispos: out std_logic_vector(3 downto 0);
	complet : out std_logic);
end Parking;

architecture arch of Parking  is

component Detect_front_1 
	port(reset,clk,e:in std_logic;
	ft_mt:out std_logic);
end component;

component CompteurP 
	port(clk,reset:in std_logic;
	up,down:in std_logic;
	counte: out std_logic_vector(3 downto 0));
end component;
component comparateur 
	port(
	A,B:in std_logic_vector(3 downto 0);
	sup_egal: out std_logic);
end component;



component registreP 
	port(d_in:in std_logic_vector(3 downto 0);
	load,reset,clk :in std_logic;
	d_out :out std_logic_vector(3 downto 0));
end component;



component soustracteur 
	port(
	A,B:in std_logic_vector(3 downto 0);
	nb_places_dispos: out std_logic_vector(3 downto 0));
end component;



	signal tup,tdown: std_logic;
	signal tcomptage,tval_max : std_logic_vector(3 downto 0);

begin
D1: Detect_front_1 port map(reset,clk,capt_entree,tup);
D2:  Detect_front_1 port map(reset,clk,capt_sortie,tdown);
Compt: CompteurP port map(clk,reset,tup,tdown,tcomptage);
Reg: registreP port map(Nb_max,Id_reg,reset,clk,tval_max);
Compar: comparateur port map (tcomptage,tval_max,complet);
sous: soustracteur port map(tcomptage,tval_max,nb_palces_dispos);

end arch;






