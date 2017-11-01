library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tri_wave is
	port(   clk: in std_logic; 
	        NUM_CLOCK_CYCLES: in integer;
	        MAX_AMP: in integer;
			reset: in std_logic;
			tri_wave1: out std_logic);
end tri_wave;

architecture Behavioural of tri_wave is

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
signal internal_counter, max_count: integer;
signal step: integer;


begin


tri_jenny: PWM_JENNY
        PORT MAP (
                  num_of_cycles => amp,
                  CLK => CLK,
                  reset => reset,
                  PWM => tri_wave1
        );
        



process(NUM_CLOCK_CYCLES, MAX_AMP)
begin 

     if(MAX_AMP = 1000) then
                
                  if( NUM_CLOCK_CYCLES = 100000000) then 
                     max_count <= 200000;
        
                  elsif( NUM_CLOCK_CYCLES = 100000) then 
                    max_count <= 200;
                  
                  end if;
    
                                           
                                           
      elsif(MAX_AMP = 15) then
                                                                                                                             
                  if( NUM_CLOCK_CYCLES = 100000000) then 
                      max_count <= 14000000;
                  
                  elsif( NUM_CLOCK_CYCLES = 100000) then 
                      max_count <= 14000;
                  
                  end if;                            
                                  
        end if;
                                  
end process;


process (CLK)

            
 begin 

                if(rising_edge(CLK)) then 
                
                        if(counter < (NUM_CLOCK_CYCLES/2) and internal_counter = max_count) then 
                             amp <= amp + 1;
                             counter <= counter+1;
                             internal_counter <= 0;
                        
                        elsif(counter_2 < (NUM_CLOCK_CYCLES/2) and internal_counter = max_count) then 
                              amp <= amp - 1;
                              counter_2 <= counter_2+1;
                              internal_counter <= 0;
                              
                        elsif(internal_counter /= max_count) then 
                              internal_counter <= internal_counter+1;
                              
                              if(counter < (NUM_CLOCK_CYCLES/2)) then 
                                             counter <= counter+1;
                              elsif(counter_2 < (NUM_CLOCK_CYCLES/2)) then
                                             counter_2 <= counter_2+1;
                              end if;
                                             
                        
                       else
                            amp <= 0;
                            counter <= 0;
                            counter_2 <= 0;
                             
                       end if;
       
                end if;
                
end process;                    







end behavioural;