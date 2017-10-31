library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity amplitude_counter is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  BTN: in STD_LOGIC_VECTOR(1 downto 0);
				  max_amp : out integer
			);
			
end amplitude_counter;

architecture Behavioural of amplitude_counter is 

type STATE_TYPE is (S0, S1, S2, S3);

signal STATE: STATE_TYPE;

begin

CHANGE_STATE: process(CLK, reset)
begin
        if (reset = '1') then
                STATE <= S0;
				max_amp <= 1000; 
        
        elsif( rising_edge(clk)) then
        

		case STATE is
		
				when S0 => 
							max_amp <= 1000; 
							if (BTN(0) = '1') then 
								STATE <= S1;
							elsif(BTN(1) = '1') then 
								STATE <= S3;
							else
								STATE <= S0;
							end if;
							
				when S1 => 
							max_amp <= 500; 
							if (BTN(0) = '1') then 
								STATE <= S2;
							elsif(BTN(1) = '1') then 
								STATE <= S0;
							else
								STATE <= S1;
							end if;
		
				when S2 => 
							max_amp <= 100; 
							if (BTN(0) = '1') then 
								STATE <= S3;
							elsif(BTN(1) = '1') then 
								STATE <= S1;
							else
								STATE <= S2;
							end if;
							
				when S3 => 
							max_amp <= 15; 
							if (BTN(0) = '1') then 
								STATE <= S0;
							elsif(BTN(1) = '1') then 
								STATE <= S2;
							else
								STATE <= S3;
							end if;
							
		              end case;
		          end if;
  end process;




end behavioural; 