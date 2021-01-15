library ieee;
use ieee.std_logic_1164.all;


entity Detect_front_1Ptb is 
end Detect_front_1Ptb;


architecture comport of Detect_front_1Ptb is 
component Detect_front_1 
	port(reset,clk,e:in std_logic;
	ft_mt:out std_logic);
end component;


signal treset,tclk, tft_mt, te: std_logic;

begin

UUT: Detect_front_1 port map(treset,tclk,te,tft_mt);


	treset<='1','0' after 10 ns;	
	process
 	begin
		tclk<='1', '0' after 10 ns;
		wait for 20 ns;
	end process;
		
	process 
	begin
		te<= '0', '1' after 60 ns;
		wait for 120 ns;
	end process;
	
end comport;
