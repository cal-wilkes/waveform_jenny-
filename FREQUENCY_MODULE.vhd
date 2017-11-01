library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_lOGIC_UNSIGNED.ALL;

entity FREQUENCY_MODULE is
		Port (
				CLK: in STD_LOGIC;
				BTN: in STD_LOGIC_VECTOR(1 downto 0);
				RST: in STD_LOGIC;
				NUM_CLOCK_CYCLES: out integer;         -- number of system clock cyles in given period
				FREQ: out STD_LOGIC --;                                          -- will pulse once per selected period 
			  );
end FREQUENCY_MODULE;

architecture Behaviour of FREQUENCY_MODULE is


type STATE_TYPE is (S0, S1); 

signal STATE: STATE_TYPE;


begin


CHANGE_STATE: process(CLK, RST) begin

        if (RST = '1') then
                STATE <= S0;
                NUM_CLOCK_CYCLES <= 100000000;
        
        elsif( rising_edge(clk)) then

		case STATE is
		
				when S0 => 
							NUM_CLOCK_CYCLES <= 100000000;
							if (BTN(0) = '1') then 
								STATE <= S1;
							elsif(BTN(1) = '1') then 
								STATE <= S1;
							else
								STATE <= S0;
							end if;
							
				when S1 => 
				
							NUM_CLOCK_CYCLES <= 100000;
							if (BTN(0) = '1') then 
								STATE <= S0;
							elsif(BTN(1) = '1') then 
								STATE <= S0;
							else
								STATE <= S1;
							end if;
							
		              end case;
		          end if;
         end process;
end behaviour;
