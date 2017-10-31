
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_numeric_std.all;


ENTITY multi_debounce IS
  PORT(
    clk     : IN  STD_LOGIC;  --input clock
    buttons  : IN  STD_LOGIC_VECTOR (3 downto 0);  --input signal to be debounced
	switches : in std_logic_vector (1 downto 0);
	d_buttons : out std_logic_vector (3 downto 0);
	d_switches : out std_logic_vector (1 downto 0)
	);
END multi_debounce;

ARCHITECTURE Behavioral OF multi_debounce IS
  
  component debounce is
	port( clk:in std_logic;
			button: in std_logic;
			result: out std_logic
			);
	end component;
	 
  BEGIN

	button_0: debounce
		port map (clk => clk,
					button => buttons(0),
					result => d_buttons(0)
					);
	button_1: debounce
		port map (clk => clk,
					button => buttons(1),
					result => d_buttons(1)
					);				
	button_2: debounce
		port map (clk => clk,
					button => buttons(2),
					result => d_buttons(2)
					);
					
	button_3: debounce
		port map (clk => clk,
					button => buttons(3),
					result => d_buttons(3)
					);
					
	swtich_0: debounce
		port map (clk => clk,
					button => switches(0),
					result => d_switches(0)
					);
					
	swtich_1: debounce
		port map (clk => clk,
					button => switches(1),
					result => d_switches(1)
					);		
    

					
END Behavioral;