library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity wave_selector_tb is
end wave_selector_tb;

ARCHITECTURE behavior OF wave_selector_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    COMPONENT wave_selector is		
        
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
                
    end COMPONENT;
 
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
     signal switch: STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal SQR_WAVE: STD_LOGIC := '0';
    signal SAW_WAVE: STD_LOGIC := '0';
    signal TRI_WAVE:  STD_LOGIC := '0';
    signal SIN_WAVE: STD_LOGIC := '0';
   -- signal enable: std_logic := '1';

	--Outputs
	
	signal wave: STD_LOGIC;
	
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
	
	uut: wave_selector		
           PORT MAP ( 
                        clk => clk, 
                        reset => reset,
                        switch => switch,
                        SQR_WAVE => SQR_WAVE,
                        SAW_WAVE => SAW_WAVE,
                        TRI_WAVE => TRI_WAVE,
                        SIN_WAVE => SIN_WAVE,
                        wave => wave
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
   
     SQR_wave_process: process
     begin
     
     SQR_WAVE <= '0';
     wait for clk_period;
     SQR_WAVE <= '1';
     wait for clk_period;
     
 end process;  
 
  saw_wave_process: process
     begin
     
     SAW_WAVE <= '0';
     wait for clk_period + clk_period;
     SAW_WAVE <= '1';
     wait for clk_period;
     
 end process;  
 
  TRI_wave_process: process
     begin
     
     TRI_WAVE <= '0';
     wait for clk_period + clk_period + clk_period;
     TRI_WAVE <= '1';
     wait for clk_period;
     
 end process;  
 
  SIN_wave_process: process
     begin
     
     SIN_WAVE <= '0';
     wait for clk_period + clk_period + clk_period + clk_period + clk_period;
     SIN_WAVE <= '1';
     wait for clk_period;
     
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
      wait for 100 ns;    
         switch(0) <= '1';
      wait for 100 ns;
          switch(0) <= '0';
          switch(1) <= '1';
      wait for 100 ns;    
          switch(0) <= '1';
    
      wait;
   end process;
   
       

END;