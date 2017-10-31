library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity frequency_module_tb is
end frequency_module_tb;

ARCHITECTURE behavior OF frequency_module_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    component frequency_module is		
        
            Port ( 
                            CLK: in STD_LOGIC;
                            BTN: in STD_LOGIC_VECTOR(1 downto 0);
                            RST: in STD_LOGIC;
                            NUM_CLOCK_CYCLES: out STD_LOGIC_VECTOR (26 downto 0);         -- number of system clock cyles in given period
                            FREQ: out STD_LOGIC --;                                          -- will pulse once per selected period 
                            --CLK_CYCLE_COUNT: out STD_LOGIC_VECTOR (26 downto 0)           -- current count of the number of system clock cycles since last pulse
                );
     end component;
 
 
   -- COMPONENT clock_divider
--    Port ( clk : in  STD_LOGIC;
    --       reset : in  STD_LOGIC;
     --      enable: in STD_LOGIC;
     --      kHz: out STD_LOGIC;
     --      seconds_port: out STD_LOGIC_VECTOR(4-1 downto 0);
     --      ten_seconds_port: out STD_LOGIC_VECTOR(3-1 downto 0);
     --      minutes_port: out STD_LOGIC_VECTOR(4-1 downto 0);
     --      ten_minutes_port: out STD_LOGIC_VECTOR(3-1 downto 0);
           -- ADDED
      --     twentyfive_MHz: out STD_LOGIC;
      --     hHz: out STD_LOGIC
    --      );
  --  END COMPONENT;
    
    --Inputs
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
     signal BTN: STD_LOGIC_VECTOR (1 downto 0) := "00";


	--Outputs
	
	signal FREQ: std_logic;
	signal NUM_CLOCK_CYCLES: STD_LOGIC_VECTOR (26 downto 0);
   -- signal kHz: STD_LOGIC;
   -- signal seconds_port: STD_LOGIC_VECTOR(4-1 downto 0);
  --  signal ten_seconds_port: STD_LOGIC_VECTOR(3-1 downto 0);
  --  signal minutes_port: STD_LOGIC_VECTOR(4-1 downto 0);
  --  signal ten_minutes_port: STD_LOGIC_VECTOR(3-1 downto 0);
    
    -- ADDED
   -- signal hHz: STD_LOGIC;
   -- signal twentyfive_MHz: STD_LOGIC;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	
	uut: frequency_module		
            Port MAP ( 
                      CLK => CLK,
                      BTN => btn,
                      RST => RESET,
                      NUM_CLOCK_CYCLES => NUM_CLOCK_CYCLES,        -- number of system clock cyles in given period
                      FREQ => FREQ --;                                          -- will pulse once per selected period 
                                       --CLK_CYCLE_COUNT: out STD_LOGIC_VECTOR (26 downto 0)           -- current count of the number of system clock cycles since last pulse
                           );
                  
   
	
   --uut: clock_divider PORT MAP (
    --      clk => clk,
      --    reset => reset,
       --   enable => enable,
       --   kHz => kHz,
       --   seconds_port => seconds_port,
       --   ten_seconds_port => ten_seconds_port,
       --   minutes_port => minutes_port,
       --   ten_minutes_port => ten_minutes_port,
          -- ADDED
       --   twentyfive_MHz => twentyfive_MHz,
       --   hHz => hHz                           
   --     );

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
      wait for 100ns;	
		reset <= '1';
      wait for 100ns;
		reset <= '0';
      wait for 100ns;    
         btn(0) <= '1';
      wait for 10ns;
         btn(0) <= '0';
      wait for 100ns;    
         btn(0) <= '1';
      wait for 10ns;
         btn(0) <= '0';
      wait for 100ns;    
         btn(0) <= '1';
      wait for 10ns;
         btn(0) <= '0';
      wait for 100ns;    
         btn(0) <= '1';
      wait for 10ns;
        btn(0) <= '0';
      wait for 100ns;
      
      
          btn(1) <= '1';
      wait for 10ns;  
          btn(1) <= '0';
      wait for 100ns;   
          btn(1) <= '1';
      wait for 10 ns;  
          btn(1) <= '0';
      wait for 100ns;     
          btn(1) <= '1';
      wait for 10 ns;  
          btn(1) <= '0';
      wait for 100ns;  
          btn(1) <= '1';
      wait for 10ns;  
          btn(1) <= '0';
      wait for 100ns;  
          btn(1) <= '1';
      wait for 10ns;  
          btn(1) <= '0';
      wait for 100ns;  
      
      wait;
   end process;
   
       

END;
