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
signal counter, internal_counter: integer;

signal period: integer;

type mem is array (0 to 99) of integer;

signal sine: mem := (500, 532, 563, 595, 626, 656, 686, 715, 743, 770, 796, 821, 845, 867, 888, 907, 924, 940, 954, 967, 977, 986, 992, 996, 1000, 1000, 998, 994, 989, 981, 972, 961, 948, 933, 916, 898, 878, 856, 833, 809, 784, 757, 729, 700, 671, 
                         640, 610, 579, 547, 515, 484, 453, 421, 390, 360, 329, 300, 271, 243, 217, 191, 167, 144, 123, 102, 84, 67, 52, 39, 28, 19, 11, 6, 2, 0, 0, 4, 8, 15, 23, 33, 45, 60, 76, 93, 112, 133, 155, 179, 204, 230, 257, 286, 315, 344, 
                         375, 405, 437, 468, 500);


begin


tri_jenny: PWM_JENNY
        PORT MAP (
                  num_of_cycles => amp,
                  CLK => CLK,
                  reset => reset,
                  PWM => SIN_wave1
        );
        
        
        
        
        
process(CLK)
      begin 

                if(rising_edge(CLK)) then 
                
                        if( num_clock_cycles = 100000) then 
                          if(counter < 99) then 
                              if(internal_counter < 1000) then 
                                    internal_counter <= internal_counter +1;
                                   amp <= sine(counter);
                               else 
                                  internal_counter <= 0;
                              end if;
                          else 
                            counter <= 0;
                          end if;
                          
                        
                        
                        elsif( num_clock_cycles = 1000000) then 
                               if(counter < 99) then 
                                        if(internal_counter < 10000) then 
                                               internal_counter <= internal_counter +1;
                                            amp <= sine(counter);
                                        else 
                                            internal_counter <= 0;
                                        end if;
                               else 
                                    counter <= 0;
                              end if;      
                              
                        
                        elsif( num_clock_cycles = 10000000) then 

                               if(counter < 99) then 
                                        if(internal_counter < 100000) then 
                                               internal_counter <= internal_counter +1;
                                             amp <= sine(counter);
                                        else 
                                            internal_counter <= 0;
                                        end if;
                               else 
                                    counter <= 0;
                              end if;


                        elsif( num_clock_cycles = 100000000) then 
                         if(counter < 99) then 
                                if(internal_counter < 1000000) then 
                                            internal_counter <= internal_counter +1;
                                            amp <= sine(counter);
                                else 
                                  internal_counter <= 0;
                                end if;
                          else 
                            counter <= 0;
                          end if;                                      
                end if;
          end if;
 end process;               



end behavioural;