
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity WAVE_JENNY is		
	Port(
	         clk: in std_logic;
			Buttons: in std_logic_vector(3 downto 0);
			Switches: in std_logic_vector(1 downto 0);
			Reset: in std_logic;
			wave: out std_logic		
	);
	
end WAVE_JENNY;

ARCHITECTURE Behavioural OF WAVE_JENNY is

component FREQuency_MODULE is
		Port (
				CLK: in STD_LOGIC;
				BTN: in STD_LOGIC_VECTOR(1 downto 0);
				RST: in STD_LOGIC;
				NUM_CLOCK_CYCLES: out STD_LOGIC_VECTOR (26 downto 0);         -- number of system clock cyles in given period
				FREQ: out STD_LOGIC --;                                          -- will pulse once per selected period 
			--	CLK_CYCLE_COUNT: out STD_LOGIC_VECTOR (26 downto 0)           -- current count of the number of system clock cycles since last pulse
			  );
end component;

component amplitude_counter is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  BTN: in STD_LOGIC_VECTOR(1 downto 0);
				  max_amp : out STD_LOGIC_VECTOR (10 downto 0)
			);
			
end component;



-- ADD COMPONENT SQUARE_WAVE

component square_wave is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  NUM_CLOCK_CYCLES: in STD_LOGIC_VECTOR (26 downto 0);       
				  FREQ: in STD_LOGIC;                                          
				  CLK_CYCLE_COUNT: in STD_LOGIC_VECTOR (26 downto 0);
				  max_amp : in STD_LOGIC_VECTOR (10 downto 0);
				  SQR_WAVE: out STD_LOGIC
			);
			
end component;





-- ADD COMPONENT SAW_WAVE

component saw_wave is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  NUM_CLOCK_CYCLES: in STD_LOGIC_VECTOR (26 downto 0);       
				  FREQ: in STD_LOGIC;                                          
				  CLK_CYCLE_COUNT: in STD_LOGIC_VECTOR (26 downto 0);
				  max_amp : in STD_LOGIC_VECTOR (10 downto 0);
				  SAW_WAVE: out STD_LOGIC
			);
			
end component;




-- ADD COMPONENT TRI_WAVE

component tri_wave is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  NUM_CLOCK_CYCLES: in STD_LOGIC_VECTOR (26 downto 0);       
				  FREQ: in STD_LOGIC;                                          
				  CLK_CYCLE_COUNT: in STD_LOGIC_VECTOR (26 downto 0);
				  max_amp : in STD_LOGIC_VECTOR (10 downto 0);
				  TRI_WAVE: out STD_LOGIC
			);
			
end component;


-- ADD COMPONENT SIN_WAVE

component sin_wave is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  NUM_CLOCK_CYCLES: in STD_LOGIC_VECTOR (26 downto 0);       
				  FREQ: in STD_LOGIC;                                          
				  CLK_CYCLE_COUNT: in STD_LOGIC_VECTOR (26 downto 0);
				  max_amp : in STD_LOGIC_VECTOR (10 downto 0);
				  SIN_WAVE: out STD_LOGIC
			);
			
end component;




component wave_selector is		
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  switch: in STD_LOGIC_VECTOR (1 downto 0);
				  SQR_WAVE: in STD_LOGIC;
				  SAW_WAVE: in STD_LOGIC;
				  TRI_WAVE: in STD_LOGIC;
				  SIN_WAVE: in STD_LOGIC;
				  wave : out  STD_LOGIC
			);
			
end component;




-- ADD INTERNAL SIGNALS TO FACILTATE THE PASSING OF SIGNALS BETWEEN COMPONENTS 

signal sqr_wave: std_logic := '0';
signal saw_wave: std_logic := '0';
signal tri_wave: std_logic;
signal sin_wave: std_logic;
signal freq: std_logic;

signal  max_amp : STD_LOGIC_VECTOR (10 downto 0);

signal CLK_CYCLE_COUNT: STD_LOGIC_VECTOR (26 downto 0);
signal NUM_CLOCK_CYCLES: STD_LOGIC_VECTOR (26 downto 0);




begin



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
				  NUM_CLOCK_CYCLES => num_clock_cycles,      
				  FREQ => freq,                                         
				  CLK_CYCLE_COUNT => CLK_CYCLE_COUNT,
				  max_amp => max_amp,
				  sqr_WAVE => sqr_wave
			);
			




saw_w: saw_wave		
	
		Port MAP ( 
				  clk => CLK,
				  reset => reset,
				  NUM_CLOCK_CYCLES => num_clock_cycles,      
				  FREQ => freq,                                         
				  CLK_CYCLE_COUNT => CLK_CYCLE_COUNT,
				  max_amp => max_amp,
				  saw_WAVE => saw_wave
			);
			



tri_W: tri_wave	
	
		Port MAP ( 
				  clk => CLK,
				  reset => reset,
				  NUM_CLOCK_CYCLES => num_clock_cycles,      
				  FREQ => freq,                                         
				  CLK_CYCLE_COUNT => CLK_CYCLE_COUNT,
				  max_amp => max_amp,
				  tri_WAVE => tri_wave
			);



SIN_W: sin_wave	
	
		Port MAP ( 
				  clk => CLK,
				  reset => reset,
				  NUM_CLOCK_CYCLES => num_clock_cycles,      
				  FREQ => freq,                                         
				  CLK_CYCLE_COUNT => CLK_CYCLE_COUNT,
				  max_amp => max_amp,
				  SIN_WAVE => sin_wave
			);








WS: wave_selector
	port map(
				  clk => CLK,
				  reset => reset,
				  switch => switches,
				  SQR_WAVE => sqr_wave,
				  SAW_WAVE => saw_wave,
				  TRI_WAVE => tri_wave,
				  SIN_WAVE => sin_wave,
				  wave => wave
	);
	



end behavioural; 
