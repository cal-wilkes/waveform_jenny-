library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity amp_counter_tb is
end amp_counter_tb;

ARCHITECTURE behavior OF amp_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    
    COMPONENT amp_counter_tb is		
        
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
    signal BTN: STD_LOGIC := '0';
	--outputs
	signal max_amp: STD_LOGIC;
	
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
	
	uut: amp_counter		
           PORT MAP ( 
                        clk => clk, 
                        reset => reset,
                        switch => switch,
						BTN => BTN,
						max_amp => max_amp,
                  );
                  
   
	
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process; 
   
   ------------------------------------------------------------------
   
    BTN_process: process
     begin
     
     BTH <= '0';
     wait for clk_period;
     BTH <= '1';
     wait for clk_period;
     
 end process;  
 
 max_amp: process
	begin 
	
	max_amp <='0';
	wait for clk_period;
    max_amp <= '1';
    wait for clk_period;


   -- Stimulus process ? Do I need this?
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
