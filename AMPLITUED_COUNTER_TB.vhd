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
			            	  BTN: in STD_LOGIC_VECTOR(1 downto 0);
				              max_amp : out STD_LOGIC_VECTOR (10 downto 0)
                );
                
    end COMPONENT;
 
    
    --Inputs
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
     signal switch: STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal SQR_WAVE: STD_LOGIC := '0';
    signal SAW_WAVE: STD_LOGIC := '0';
    signal TRI_WAVE:  STD_LOGIC := '0';
    signal SIN_WAVE: STD_LOGIC := '0';

	
	signal wave: STD_LOGIC;
	
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
