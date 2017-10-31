library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PWM_JENNY_TB is
end PWM_JENNY_TB;

ARCHITECTURE behavior OF PWM_JENNY_TB IS 


COMPONENT PWM_JENNY is
	Generic ( num_of_cycles: integer:=  300
			);				
	
		Port ( 
				  clk : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  PWM : out  STD_LOGIC
			);
			
end COMPONENT;
 
    -- Component Declaration for the Unit Under Test (UUT)
 
 --   COMPONENT clock_divider
 ---   Port ( clk : in  STD_LOGIC;
  --         reset : in  STD_LOGIC;
   --        enable: in STD_LOGIC;
   --        kHz: out STD_LOGIC;
    --       seconds_port: out STD_LOGIC_VECTOR(4-1 downto 0);
     --      ten_seconds_port: out STD_LOGIC_VECTOR(3-1 downto 0);
    --       minutes_port: out STD_LOGIC_VECTOR(4-1 downto 0);
     --      ten_minutes_port: out STD_LOGIC_VECTOR(3-1 downto 0);
           -- ADDED
     --      twentyfive_MHz: out STD_LOGIC;
      --     hHz: out STD_LOGIC
    --      );
   -- END COMPONENT;
    
    --Inputs
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
  --  signal enable: std_logic := '1';

	--Outputs
    signal PWM: STD_LOGIC;
   -- signal seconds_port: STD_LOGIC_VECTOR(4-1 downto 0);
   --- signal ten_seconds_port: STD_LOGIC_VECTOR(3-1 downto 0);
   -- signal minutes_port: STD_LOGIC_VECTOR(4-1 downto 0);
   -- signal ten_minutes_port: STD_LOGIC_VECTOR(3-1 downto 0);
    
    -- ADDED
    --signal hHz: STD_LOGIC;
    --signal twentyfive_MHz: STD_LOGIC;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	
	UUT: PWM_JENNY 
            Port MAP ( 
                      clk => clk,
                      reset => reset,
                      PWM => PWM
                );
                
	
	
 --  uut: clock_divider PORT MAP (
     --     clk => clk,
       --   reset => reset,
       --   enable => enable,
       --   kHz => kHz,
       ---   seconds_port => seconds_port,
       --   ten_seconds_port => ten_seconds_port,
       --   minutes_port => minutes_port,
       --   ten_minutes_port => ten_minutes_port,
        --  -- ADDED
        --  twentyfive_MHz => twentyfive_MHz,
       --   hHz => hHz                           
      --  );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process; 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '0';
      wait for 100 ns;	
		reset <= '1';
      wait for 100 ns;
		reset <= '0';
      wait;
   end process;

END;