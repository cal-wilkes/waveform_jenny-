
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_numeric_std.all;


ENTITY multi_debounce IS
  PORT(
    clk     : IN  STD_LOGIC;  --input clock
    buttons  : IN  STD_LOGIC_VECTOR (2 downto 0);  --input signal to be debounced
	swtiches : in std_logic_vector (14 downto 0);
	d_buttons : in std_logic_vector (2 downto 0);
	d_swtiches : in std_logic_vector (14 downto 0)
	);
END multi_debounce;

ARCHITECTURE Behavioral OF multi_debounce IS
  
  component debouncer is
	port( clk:in std_logic;
			button: in std_logic;
			result: out std_logic
			);
	end component;
	 
  BEGIN

	button_0: debouncer
		port map (clk => clk,
					button => buttons(0),
					result => d_buttons(0)
					);
	button_1: debouncer
		port map (clk => clk,
					button => buttons(1),
					result => d_buttons(1)
					);				
	button_2: debouncer
		port map (clk => clk,
					button => buttons(2),
					result => d_buttons(2)
					);
					
	swtich_0: debouncer
		port map (clk => clk,
					button => switches(0),
					result => d_switches(0)
					);
					
	swtich_1: debouncer
		port map (clk => clk,
					button => switches(1),
					result => d_switches(1)
					);		
    
	swtich_2: debouncer
		port map (clk => clk,
					button => switches(2),
					result => d_switches(2)
					);
					
	swtich_3: debouncer
		port map (clk => clk,
					button => switches(3),
					result => d_switches(3)
					);				

    swtich_4: debouncer
		port map (clk => clk,
					button => switches(4),
					result => d_switches(4)
					);
					
	swtich_5: debouncer
		port map (clk => clk,
					button => switches(5),
					result => d_switches(5)
					);

	swtich_6: debouncer
		port map (clk => clk,
					button => switches(6),
					result => d_switches(6)
					);

	swtich_7: debouncer
		port map (clk => clk,
					button => switches(7),
					result => d_switches(7)
					);				

	swtich_8: debouncer
		port map (clk => clk,
					button => switches(8),
					result => d_switches(8)
					);
					
	swtich_9: debouncer
		port map (clk => clk,
					button => switches(9),
					result => d_switches(9)
					);

	swtich_10: debouncer
		port map (clk => clk,
					button => switches(10),
					result => d_switches(10)
					);
					
	swtich_11: debouncer
		port map (clk => clk,
					button => switches(11),
					result => d_switches(11)
					);

	swtich_12: debouncer
		port map (clk => clk,
					button => switches(12),
					result => d_switches(12)
					);
					
	swtich_13: debouncer
		port map (clk => clk,
					button => switches(13),
					result => d_switches(13)
					);
					
	swtich_14: debouncer
		port map (clk => clk,
					button => switches(14),
					result => d_switches(14)
					);
					
	swtich_15: debouncer
		port map (clk => clk,
					button => switches(15),
					result => d_switches(15)
					);

					
END Behavioral;
