library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity square_wave is
	port(   clk: in std_logic; 
	        NUM_CLOCK_CYCLES: in integer;
	        MAX_AMP: in integer;
			reset: in std_logic;
			sqr_wave1: out std_logic);
end square_wave;

architecture Behavioural of square_wave is

component PWM_JENNY is			
		Port ( 
		          num_of_cycles: in integer;
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  PWM : out  STD_LOGIC
			);
			
end component;


signal amp: integer;
signal counter: integer;



begin


sqr_jenny: PWM_JENNY
        PORT MAP (
                  num_of_cycles => amp,
                  CLK => CLK,
                  reset => reset,
                  PWM => sqr_wave1
        );
        
        
process (CLK)

begin 

                if(rising_edge(CLK)) then 
                
                        if(counter < (NUM_CLOCK_CYCLES/2)) then 
                             amp <= max_amp;
                             counter <= counter+1;
                        
                        elsif(counter < NUM_CLOCK_CYCLES) then 
                             amp <= 0;
                             counter <= counter+1;
                        
                       else
                            counter <= 0;
                             
                       end if;
       
                end if;
                
end process;                
                







end behavioural;