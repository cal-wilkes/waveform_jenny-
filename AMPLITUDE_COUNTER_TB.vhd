library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity amplitude_counter_tb is
end amplitude_counter_tb;

ARCHITECTURE behavior OF amplitude_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    component amplitude_counter is		
        
            Port ( 
                      clk : in  STD_LOGIC;
                      reset : in  STD_LOGIC;
                      BTN: in STD_LOGIC_VECTOR(1 downto 0);
                      max_amp : out STD_LOGIC_VECTOR (10 downto 0)
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
	
	signal max_amp: STD_LOGIC_VECTOR (10 downto 0);
	
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
	
	uut: amplitude_counter		
            Port MAP ( 
                      clk => CLK,
                      reset => reset,
                      BTN => BTN,
                      max_amp => max_amp
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
      wait for 10 ns;
         btn(0) <= '0';
      wait for 100ns;    
         btn(0) <= '1';
      wait for 10 ns;
        btn(0) <= '0';
      wait for 100 ns;
      
      
          btn(1) <= '1';
      wait for 10 ns;  
          btn(1) <= '0';
      wait for 100 ns;   
          btn(1) <= '1';
      wait for 10 ns;  
          btn(1) <= '0';
      wait for 100 ns;     
          btn(1) <= '1';
      wait for 10 ns;  
          btn(1) <= '0';
      wait for 100 ns;  
          btn(1) <= '1';
      wait for 10 ns;  
          btn(1) <= '0';
      wait for 100 ns;  
          btn(1) <= '1';
      wait for 10 ns;  
          btn(1) <= '0';
      wait for 100 ns;  
      
      wait;
   end process;
   
       

END;