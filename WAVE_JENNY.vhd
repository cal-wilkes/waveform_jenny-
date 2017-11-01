
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity WAVE_JENNY is		
	Port(
	         clk: in std_logic;
			DButtons: in std_logic_vector(3 downto 0);
			DSwitches: in std_logic_vector(1 downto 0);
			Reset: in std_logic;
			wave: out std_logic		
	);
	
end WAVE_JENNY;

ARCHITECTURE Behavioural OF WAVE_JENNY is


component multi_debounce IS
  PORT(
    clk     : IN  STD_LOGIC;  --input clock
    buttons  : IN  STD_LOGIC_VECTOR (3 downto 0);  --input signal to be debounced
	switches : in std_logic_vector (1 downto 0);
	d_buttons : out std_logic_vector (3 downto 0);
	d_switches : out std_logic_vector (1 downto 0)
	);
END component;


component FREQuency_MODULE is
		Port (
				CLK: in STD_LOGIC;
				BTN: in STD_LOGIC_VECTOR(1 downto 0);
				RST: in STD_LOGIC;
				NUM_CLOCK_CYCLES: out integer;         -- number of system clock cyles in given period
				FREQ: out STD_LOGIC --;                                          -- will pulse once per selected period 
			--	CLK_CYCLE_COUNT: out STD_LOGIC_VECTOR (26 downto 0)           -- current count of the number of system clock cycles since last pulse
			  );
end component;

component amplitude_counter is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  BTN: in STD_LOGIC_VECTOR(1 downto 0);
				  max_amp : out integer
			);
			
end component;



-- ADD COMPONENT SQUARE_WAVE

component square_wave is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  NUM_CLOCK_CYCLES: in integer;       
				--  FREQ: in STD_LOGIC;                                          
				--  CLK_CYCLE_COUNT: in integer;
				  max_amp: in integer;
				  SQR_WAVE1: out STD_LOGIC
			);
			
end component;





-- ADD COMPONENT SAW_WAVE

component saw_wave is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  NUM_CLOCK_CYCLES: in integer;       
				--  FREQ: in STD_LOGIC;                                          
				--  CLK_CYCLE_COUNT: in STD_LOGIC_VECTOR (26 downto 0);
				  max_amp: in integer;
				  SAW_WAVE1: out STD_LOGIC
			);
			
end component;




-- ADD COMPONENT TRI_WAVE

component tri_wave is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  NUM_CLOCK_CYCLES: in integer;       
				  --FREQ: in STD_LOGIC;                                          
				  --CLK_CYCLE_COUNT: in STD_LOGIC_VECTOR (26 downto 0);
				  max_amp : in integer;
				  TRI_WAVE1: out STD_LOGIC
			);
			
end component;


-- ADD COMPONENT SIN_WAVE

component sin_wave is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  NUM_CLOCK_CYCLES: in integer;       
				--  FREQ: in STD_LOGIC;                                          
				 -- CLK_CYCLE_COUNT: in STD_LOGIC_VECTOR (26 downto 0);
				  max_amp : in integer;
				  SIN_WAVE1: out STD_LOGIC
			);
			
end component;




component wave_selector is		
	
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
			
end component;




-- ADD INTERNAL SIGNALS TO FACILTATE THE PASSING OF SIGNALS BETWEEN COMPONENTS 

signal sqr_wave1: std_logic;
signal saw_wave1: std_logic;
signal tri_wave1: std_logic;
signal sin_wave1: std_logic;
signal freq: std_logic;

signal  max_amp : integer;

--signal CLK_CYCLE_COUNT: STD_LOGIC_VECTOR (26 downto 0);
signal NUM_CLOCK_CYCLES: integer;


signal buttons: std_logic_vector(3 downto 0);
signal switches: std_logic_vector(1 downto 0);


begin

dbnc: multi_debounce
  PORT MAP(
                clk => clk,
                buttons  => DButtons,
	            switches => DSwitches,
	            d_buttons => Buttons,
	            d_switches => Switches
	);




frequency: frequency_module
	port map(
				CLK => CLK,
				BTN => buttons(3 downto 2),
				RST => reset,
				NUM_CLOCK_CYCLES => NUM_CLOCK_CYCLES,
				FREQ => freq --,
				--CLK_CYCLE_COUNT => clk_cycle_count 
	);




AMP: amplitude_counter
	port map(
				clk => clk,
				reset => reset,
				BTN => buttons(1 downto 0),
				max_amp => max_amp
	);


sqr_w: square_wave		
	
		Port MAP ( 
				  clk => CLK,
				  reset => reset,
				  NUM_CLOCK_CYCLES => NUM_CLOCK_CYCLES,      
				  --FREQ => freq,                                         
				 -- CLK_CYCLE_COUNT => CLK_CYCLE_COUNT,
				  max_amp => max_amp,
				  sqr_WAVE1 => sqr_wave1
			);
			




saw_w: saw_wave		
	
		Port MAP ( 
				  clk => CLK,
				  reset => reset,
				  NUM_CLOCK_CYCLES => num_clock_cycles,      
				--  FREQ => freq,                                         
				 -- CLK_CYCLE_COUNT => CLK_CYCLE_COUNT,
				  max_amp => max_amp,
				  saw_WAVE1 => saw_wave1
			);
			



tri_W: tri_wave	
	
		Port MAP ( 
				  clk => CLK,
				  reset => reset,
				  NUM_CLOCK_CYCLES => num_clock_cycles,      
				  --FREQ => freq,                                         
				 -- CLK_CYCLE_COUNT => CLK_CYCLE_COUNT,
				  max_amp => max_amp,
				  tri_WAVE1 => tri_wave1
			);



SIN_W: sin_wave	
	
		Port MAP ( 
				  clk => CLK,
				  reset => reset,
				  NUM_CLOCK_CYCLES => num_clock_cycles,      
				  --FREQ => freq,                                         
				  --CLK_CYCLE_COUNT => CLK_CYCLE_COUNT,
				  max_amp => max_amp,
				  SIN_WAVE1 => sin_wave1
			);








WS: wave_selector
	port map(
				  clk => CLK,
				  reset => reset,
				  switch => switches,
				  SQR_WAVE1 => sqr_wave1,
				  SAW_WAVE1 => saw_wave1,
				  TRI_WAVE1 => tri_wave1,
				  SIN_WAVE1 => sin_wave1,
				  wave => wave
	);
	



end behavioural; 
