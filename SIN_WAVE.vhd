library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SIN_wave is
	port(   clk: in std_logic; 
	        NUM_CLOCK_CYCLES: in integer;
	        MAX_AMP: in integer;
			reset: in std_logic;
			SIN_wave1: out std_logic);
end SIN_wave;

architecture Behavioural of SIN_wave is

component PWM_JENNY is			
		Port ( 
		          num_of_cycles: in integer;
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  PWM : out  STD_LOGIC
			);
			
end component;


signal amp: integer :=0;
signal counter, counter_2: integer;



begin


tri_jenny: PWM_JENNY
        PORT MAP (
                  num_of_cycles => amp,
                  CLK => CLK,
                  reset => reset,
                  PWM => SIN_wave1
        );
        
        
process (CLK)

            
 begin 

                if(rising_edge(CLK)) then 
                
                        if(counter < (NUM_CLOCK_CYCLES/2)) then 
                             amp <= amp + (max_amp/(NUM_CLOCK_CYCLES/2)); --- NEED TO CHANGE LOGIC FROM RISING LINEAR TO POSITIVE SINE
                             counter <= counter+1;
                        
                        elsif(counter_2 < (NUM_CLOCK_CYCLES/2)) then 
                              amp <= amp - (max_amp/(NUM_CLOCK_CYCLES/2));  ----- NEED TO CHANGE LOGIC FROM RISING LINEAR TO POSITIVE SINE
                              counter_2 <= counter+1;
                        
                       else
                            counter <= 0;
                            counter_2 <= 0;
                             
                       end if;
       
                end if;
                
end process;                    







end behavioural;