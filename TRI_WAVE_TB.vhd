library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TRI_WAVE_TB is
end TRI_WAVE_TB;

ARCHITECTURE behavior OF TRI_WAVE_TB IS 


component tri_wave is
	port(   clk: in std_logic; 
	        NUM_CLOCK_CYCLES: in integer;
	        MAX_AMP: in integer;
			reset: in std_logic;
			tri_wave1: out std_logic);
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
    signal NUM_CLOCK_CYCLES: integer;
    signal MAX_AMP: integer;
  --  signal enable: std_logic := '1';

	--Outputs
    signal tri_wave1: STD_LOGIC;
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
	
	UUT: tri_wave 
            Port MAP ( 
                      clk => clk,
                      reset => reset,
                      NUM_CLOCK_CYCLES => NUM_CLOCK_CYCLES,
                      MAX_AMP => MAX_AMP,
                      tri_wave1 => tri_wave1
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
		
		
		NUM_CLOCK_CYCLES <= 100000000;
      wait for 100 ns;	
        MAX_AMP <= 15;
      wait for 100 ns;   
        MAX_AMP <= 1000;
      wait for 100 ns; 
        NUM_CLOCK_CYCLES <= 100000;
      wait for 100 ns;
       MAX_AMP <= 15;
      wait for 100 ns;   
       MAX_AMP <= 1000;
  
      
      wait;
   end process;

END;