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
begin

dc : entity work.ES_DCMotor_Main port map (
    clk, '0', '0', '0', '0', '0', PWM, Dir, Brake, Switch, LED, clockCtDbg, widthDbg, pwmCtDbg, SetFreqDbg
);

clk_process : process
begin
    clk <= '0';
    wait for clk_period/2;  --for 0.5 ns signal is '0'.
    clk <= '1';
    wait for clk_period/2;  --for next 0.5 ns signal is '1'.
end process;

end Behavioral;
