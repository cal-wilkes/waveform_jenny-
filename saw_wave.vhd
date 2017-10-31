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
signal counter: integer;



begin


saw_jenny: PWM_JENNY
        PORT MAP (
                  num_of_cycles => amp,
                  CLK => CLK,
                  reset => reset,
                  PWM => saw_wave1
        );
        
        
process (CLK)

begin 

                if(rising_edge(CLK)) then 
                
                        if(counter < NUM_CLOCK_CYCLES) then 
                             amp <= amp + (max_amp/NUM_CLOCK_CYCLES);
                             counter <= counter+1;
                       
                       else
                            amp <= 0;
                            counter <= 0;
                             
                       end if;
       
                end if;
                
end process;                
                







end behavioural;