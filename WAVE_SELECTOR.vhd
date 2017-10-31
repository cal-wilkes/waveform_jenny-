library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity wave_selector is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  switch: in STD_LOGIC_VECTOR (1 downto 0);
				  SQR_WAVE1: in STD_LOGIC;
				  SAW_WAVE1: in STD_LOGIC;
				  TRI_WAVE1: in STD_LOGIC;
				  SIN_WAVE1: in STD_LOGIC;
				  wave : out  STD_LOGIC
			);
			
end wave_selector;

architecture Behavioural of wave_selector is 


begin

process(CLK, SWITCH, reset)

begin 

    if (reset = '1') then 
			wave <= '0';
	
	elsif(rising_edge(clk)) then 
		if((switch(0) = '0') and (switch(1) = '0')) then 
			wave <= SQR_WAVE1;
		
		elsif((switch(0) = '1') and (switch(1) = '0')) then 
			wave <= SAW_WAVE1;
			
		elsif((switch(0) = '0') and (switch(1) = '1')) then 
			wave <= TRI_WAVE1;

		elsif((switch(0) = '1') and (switch(1) = '1')) then 
			wave <= SIN_WAVE1;
		end if;
	end if;

end process;	


end behavioural;