library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_lOGIC_UNSIGNED.ALL;

entity FREQ_MODULE is
		Port (
				CLK: in STD_LOGIC;
				BTN: in STD_LOGIC_VECTOR(1 downto 0);
				RST: in STD_LOGIC;
				NUM_CLOCK_CYCLES: out STD_LOGIC_VECTOR (26 downto 0);         -- number of system clock cyles in given period
				FREQ: out STD_LOGIC;                                          -- will pulse once per selected period 
				CLK_CYCLE_COUNT: out STD_LOGIC_VECTOR (26 downto 0)           -- current count of the number of system clock cycles since last pulse
			  );
end FREQ_MODULE;

architecture Behaviour of FREQ_MODULE is

component downcounter is
	Generic ( period: integer:= 4;
				WIDTH: integer:= 3);
		Port ( clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  enable : in  STD_LOGIC;
				  zero : out  STD_LOGIC;
				  value: out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end component;

type STATE_TYPE is (S0, S1, S2, S3);

signal STATE: STATE_TYPE;

signal kilohertz, hundredhertz, tenhertz, onehertz: STD_LOGIC;
signal kilohertzval, hundredhertzval, tenhertzval, onehertzval: STD_LOGIC_VECTOR(26 downto 0);


begin


kiloHzClock: downcounter
generic map(
				period => (100000-1), 
				WIDTH => 27
			)
port map (
				clk => clk,
				reset => RST,
				enable => '1',
				zero => kilohertz,
				value => kilohertzval			
);

hundredHzClock: downcounter
generic map(
				period => (1000000-1),	
				WIDTH => 27
			)
port map (
				clk => clk,
				reset => RST,
				enable => '1',
				zero => hundredhertz,
				value => hundredhertzval			
);

tenHzClock: downcounter
generic map(
				period => (10000000-1),	
				WIDTH => 27
			)
port map (
				clk => clk,
				reset => RST,
				enable => hundredhertz,
				zero => tenhertz,
				value => tenhertzval			
);

oneHzClock: downcounter
generic map(
				period => (100000000-1),	
				WIDTH => 27
			)
port map (
				clk => clk,
				reset => RST,
				enable => tenhertz,
				zero => onehertz,
				value => onehertzval			
);

CHANGE_STATE: process(CLK, RST) begin

        if (RST = '1') then
                STATE <= S0;
                FREQ <= onehertz;
                NUM_CLOCK_CYCLES <= "101111101011110000100000000";
                CLK_CYCLE_COUNT <= onehertzval;
        
        elsif( rising_edge(clk)) then
        

		case STATE is
		
				when S0 => 
							FREQ <= onehertz;
							NUM_CLOCK_CYCLES <= "101111101011110000100000000";
							CLK_CYCLE_COUNT <= onehertzval;
							if (BTN(0) = '1') then 
								STATE <= S1;
							elsif(BTN(1) = '1') then 
								STATE <= S3;
							else
								STATE <= S0;
							end if;
							
				when S1 => 
							FREQ <= tenhertz;
							NUM_CLOCK_CYCLES <= "000100110001001011010000000";
							CLK_CYCLE_COUNT <= tenhertzval;
							if (BTN(0) = '1') then 
								STATE <= S2;
							elsif(BTN(1) = '1') then 
								STATE <= S0;
							else
								STATE <= S1;
							end if;
		
				when S2 => 
							FREQ <= hundredhertz;
							NUM_CLOCK_CYCLES <= "000000011110100001001000000";
							CLK_CYCLE_COUNT <= hundredhertzval;
							if (BTN(0) = '1') then 
								STATE <= S3;
							elsif(BTN(1) = '1') then 
								STATE <= S1;
							else
								STATE <= S2;
							end if;
							
				when S3 => 
							FREQ <= kilohertz;
							NUM_CLOCK_CYCLES <= "000000000011000011010100000";
							CLK_CYCLE_COUNT <= kilohertzval;
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
end behaviour;

		
		