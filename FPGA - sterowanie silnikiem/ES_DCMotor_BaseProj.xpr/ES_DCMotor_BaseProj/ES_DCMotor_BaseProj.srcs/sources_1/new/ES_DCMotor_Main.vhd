----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.02.2022 23:55:13
-- Design Name: 
-- Module Name: ES_DCMotor_Main - Behavioral
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
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ES_DCMotor_Main is
    Port ( CLK100MHz : in STD_LOGIC;
           Enc1_A : in STD_LOGIC;
           Enc1_B : in STD_LOGIC;
           Enc2_A : in STD_LOGIC;
           Enc2_B : in STD_LOGIC;
           Therm : in STD_LOGIC;
           PWM : out STD_LOGIC;
           Dir : out STD_LOGIC;
           Brake : out STD_LOGIC;
           Switch : in STD_LOGIC_VECTOR (15 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0)
--            clockCtDbg : out integer;
--            widthDbg : out STD_LOGIC_VECTOR (10 downto 0);
--            pwmCtDbg : out integer;
--            SetFreqDbg : out STD_LOGIC_VECTOR (2 downto 0)
            );
end ES_DCMotor_Main;

architecture Behavioral of ES_DCMotor_Main is
begin

MainProcess : process (CLK100MHz)

    variable  clockCt : integer := 0;
    variable  width : STD_LOGIC_VECTOR (10 downto 0) := "01111111111";
    variable  pwmCt : integer := 0;
    variable SetFreq : STD_LOGIC_VECTOR (2 downto 0) := "100";
begin
    if ( CLK100MHz'event and CLK100MHz = '1' ) then
        LED(15 downto 5) <= Switch(15 downto 5);
        LED(0) <= Enc1_A;
        LED(1) <= Enc1_B;
        LED(2) <= Enc2_A;
        LED(3) <= Enc2_B;
        LED(4) <= Therm;
        width := Switch(10 downto 0); -- Switch(0 to 9);
        Dir <= Switch(14);
        Brake <= Switch(15);
        SetFreq := Switch(13 downto 11);
        
        if (clockCt >= (4999 * TO_INTEGER(unsigned(SetFreq)) / 2048)) then
            clockCt := 0;
            
            if (pwmCt <= width) then
                PWM <= '1';
            else
                PWM <= '0';
            end if;
            
            pwmCt := pwmCt + 1;
            
            if (pwmCt = 2048) then
                pwmCt := 0;
            end if;
        end if;
        
        clockCt := clockCt + 1;
    end if;
        
--    clockCtDbg <= clockCt;
--    widthDbg <= width;
--    pwmCtDbg <= pwmCt;
--    SetFreqDbg <= SetFreq;

    
end process MainProcess;

end Behavioral;
