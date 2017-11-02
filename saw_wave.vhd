library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity saw_wave is
	port(   clk: in std_logic; 
	        NUM_CLOCK_CYCLES: in integer;
	        MAX_AMP: in integer;
			reset: in std_logic;
			saw_wave1: out std_logic);
end saw_wave;

architecture Behavioural of saw_wave is

component PWM_JENNY is			
		Port ( 
		          num_of_cycles: in integer;
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  PWM : out  STD_LOGIC
			);
			
end component;


signal amp: integer :=0;
signal counter, internal_counter, max_count: integer;
signal step: integer;



begin


saw_jenny: PWM_JENNY
        PORT MAP (
                  num_of_cycles => amp,
                  CLK => CLK,
                  reset => reset,
                  PWM => saw_wave1
        );
        
        
        
        
 process(MAX_AMP, NUM_CLOCK_CYCLES)
 begin       
             if(MAX_AMP = 1000) then
    
                             if( NUM_CLOCK_CYCLES = 100000000) then 
                                       max_count <= 1000000;

                             elsif( NUM_CLOCK_CYCLES = 100000) then 
                                       max_count <= 10000;
                             end if;

                               
                               
            elsif(MAX_AMP = 15) then
                                                                                                                 
                               if( NUM_CLOCK_CYCLES = 100000000) then 
                                      max_count <= 70000000;
                                      
                               elsif( NUM_CLOCK_CYCLES = 100000) then 
                                      max_count <= 70000;
                              end if;                            
                      
                      end if;
               
end process; 
        
        
   
        
        
process (CLK)

begin 

                if(rising_edge(CLK)) then 
                        
                
                        if((counter < NUM_CLOCK_CYCLES) and (internal_counter = max_count)) then 
                             amp <= amp + 10;
                             counter <= counter+1;
                             internal_counter <= 0;
                       
                        elsif(counter < NUM_CLOCK_CYCLES) then                    
                             counter <= counter+1;
                             internal_counter <= internal_counter +1;
                       
                       else
                            amp <= 0;
                            counter <= 0;
                            internal_counter <= 0;
                             
                       end if;
       
                end if;
                
end process;                
                


end behavioural;