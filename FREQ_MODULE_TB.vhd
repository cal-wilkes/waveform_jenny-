----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2017 04:04:32 PM
-- Design Name: 
-- Module Name: FREQ_MODULE_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FREQ_MODULE_TB is
end FREQ_MODULE_TB;

architecture Behavioral of FREQ_MODULE_TB is

component FREQ_MODULE is 
           	Port (
                    CLK: in STD_LOGIC;
                    BTN: in STD_LOGIC_VECTOR(1 downto 0);
                    RST: in STD_LOGIC;
                    NUM_CLOCK_CYCLES: out STD_LOGIC_VECTOR (26 downto 0);         -- number of system clock cyles in given period
                    FREQ: out STD_LOGIC;                                          -- will pulse once per selected period 
                    CLK_CYCLE_COUNT: out STD_LOGIC_VECTOR (26 downto 0)           -- current count of the number of system clock cycles since last pulse
          );
end component;

signal clk: STD_LOGIC;
signal rst: STD_LOGIC;
signal freq: STD_LOGIC;

signal  NUM_CLOCK_CYCLES : STD_LOGIC_VECTOR (26 downto 0);
signal CLK_CYCLE_COUNT: STD_LOGIC_VECTOR (26 downto 0); 
signal button: STD_LOGIC_VECTOR(1 downto 0) := "00";


begin

uut: FREQ_MODULE
    port map(
              CLK => CLK,
              BTN => Button,
             RST => RST,
              NUM_CLOCK_CYCLES => NUM_CLOCK_CYCLES,
              FREQ => FREQ,
              CLK_CYCLE_COUNT => CLK_CYCLE_COUNT
            );
              
clk <= not clk after 5ns;

process
   begin
            RST <= '1', '0' after 20ns;
            Button(0) <= '1' after 60ns, '0' after 70ns, '1' after 120ns, '0' after 130 ns, '1' after 180ns, '0' after 190 ns, '1' after 220ns, '0' after 230 ns; 
            Button(1) <= '1' after 260ns, '0' after 270ns, '1' after 320ns, '0' after 330 ns, '1' after 380ns, '0' after 390 ns, '1' after 420ns, '0' after 430 ns;   
            
   end process;

end Behavioral;
