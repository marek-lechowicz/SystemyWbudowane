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
--           Enc1_A_old : out STD_LOGIC;
--           Enc1_B_old : out STD_LOGIC;
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
--            SetFreqDbg : out STD_LOGIC_VECTOR (2 downto 0);
--            enc_1_value : out integer
            );
end ES_DCMotor_Main;

architecture Behavioral of ES_DCMotor_Main is
    -- encoder signals
    signal old_A: STD_LOGIC := '0';
    signal old_B: STD_LOGIC := '0';
    signal old2_A: STD_LOGIC := '0';
    signal old2_B: STD_LOGIC := '0';
begin

MainProcess : process (CLK100MHz)

    variable  clockCt : integer := 0;
    variable  width : STD_LOGIC_VECTOR (10 downto 0) := "01111111111";
    variable  pwmCt : integer := 0;
    variable SetFreq : STD_LOGIC_VECTOR (2 downto 0) := "100";
--    -- encoder variables
    variable value_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    variable value_2 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    variable diff : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
--    variable value_1 : integer := 0;
--    variable value_2 : integer := 0;
    
begin
    if ( CLK100MHz'event and CLK100MHz = '1' ) then
        LED(15 downto 1) <= diff(15 downto 1);      
--        LED(0) <= Enc1_A;
--        LED(1) <= Enc1_B;
--        LED(2) <= Enc2_A;
--        LED(3) <= Enc2_B;
--        LED(4) <= Therm;
--        width := Switch(10 downto 0); -- Switch(0 to 9);
        diff := std_logic_vector(abs(signed(value_2) - signed(value_1)));
        width := diff(10 downto 0);
        if (signed(value_2) - signed(value_1) < 0) then
            LED(0) <= '0';
            Dir <= '0';
        else 
            LED(0) <= '1';
            Dir <= '1';
        end if;
        Brake <= Switch(15);
        SetFreq := Switch(13 downto 11);
        
        -- encoder logic
        -- TODO dopisaæ zerowanie - 500 impulsów na obrót
        old_A <= Enc1_A;
        old_B <= Enc1_B;
        if((old_A /= Enc1_A) or (old_B /= Enc1_B)) then
            if (old_A /= Enc1_B) then
                value_1 := value_1 - 1;
            else
                value_1 := value_1 + 1;
            end if;
        end if;
        
        old2_A <= Enc2_A;
        old2_B <= Enc2_B;
        if((old2_A /= Enc2_A) or (old2_B /= Enc2_B)) then
            if (old2_A /= Enc2_B) then
                value_2 := value_2 - 1;
            else
                value_2 := value_2 + 1;
            end if;
        end if;
        
--        if (value_1 > 1000) then
--            value_1 := "0000000000000000";
--        end if;
--       if (value_2 > 1000) then
--            value_2 := "0000000000000000";
--        end if;

            
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
    
--Enc1_A_old <= old_A;
--Enc1_B_old <= old_B;
--enc_1_value <= value_1;       
--clockCtDbg <= clockCt;
--widthDbg <= width;
--pwmCtDbg <= pwmCt;
--SetFreqDbg <= SetFreq;

    
end process MainProcess;

end Behavioral;
