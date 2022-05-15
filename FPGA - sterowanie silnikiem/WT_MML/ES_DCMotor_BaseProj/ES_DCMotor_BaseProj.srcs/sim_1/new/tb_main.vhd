----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.03.2022 17:01:11
-- Design Name: 
-- Module Name: tb_main - Behavioral
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

entity tb_main is
--  Port ( );
end tb_main;

architecture Behavioral of tb_main is
    signal Enc1_A : STD_LOGIC := '0';
    signal Enc1_B : STD_LOGIC := '0';
    signal Enc1_A_old : STD_LOGIC := '0';
    signal Enc1_B_old : STD_LOGIC := '0';
    signal Enc2_A : STD_LOGIC :='0';
    signal  Enc2_B : STD_LOGIC :='0';
    signal clk : std_logic := '0';
    signal PWM : STD_LOGIC;
    signal Dir : STD_LOGIC := '1';
    signal Brake : STD_LOGIC := '0';
    signal Switch : STD_LOGIC_VECTOR (15 downto 0) := "0010110000100000";
    signal LED : STD_LOGIC_VECTOR (15 downto 0);
    constant clk_period : time := 10 ns;
    signal clockCtDbg : integer;
    signal widthDbg : STD_LOGIC_VECTOR (10 downto 0);
    signal pwmCtDbg : integer;
    signal SetFreqDbg : STD_LOGIC_VECTOR (2 downto 0);
    signal enc_1_value : integer := 0;
begin

dc : entity work.ES_DCMotor_Main port map (
    clk, Enc1_A, Enc1_B, Enc1_A_old, Enc1_B_old, '0', '0', '0', PWM, Dir, Brake, Switch, LED, clockCtDbg, widthDbg, pwmCtDbg, SetFreqDbg, enc_1_value
);

clk_process : process
begin
    clk <= '0';
    wait for clk_period/2;  --for 0.5 ns signal is '0'.
    clk <= '1';
    wait for clk_period/2;  --for next 0.5 ns signal is '1'.
end process;

enc_process : process
begin
    Enc1_A <= '1';
    wait for clk_period * 1000; 
    Enc1_B <= '0';
    wait for clk_period * 1000; 
    Enc1_A <= '0';
    wait for clk_period * 1000;
    Enc1_B <= '1';
    wait for clk_period * 1000; 
--    Enc1_B <= '1';
--    wait for clk_period*1000; 
--    Enc1_A <= '0';
--    wait for clk_period*1000; 
--    Enc1_B <= '0';
--    wait for clk_period*1000;
--    Enc1_A <= '1';
--    wait for clk_period*1000; 
end process;

end Behavioral;
