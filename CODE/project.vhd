-- Library Access
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Digital Combination Lock Entity
entity comb_lock is
port
(
 ld1, ld2, ld3 : in std_logic; -- Combination Digit Marker 
 enter, reset, clk : in std_logic; -- Controller  Inputs
 value : in std_logic_vector(3 downto 0); -- 4 bit combination value
 unlock : out std_logic -- Controller Output
);
end comb_lock;

-- Behaviour of Lock Circuit
architecture behaviour of comb_lock is

-- Declare Signals
type lock_state is (Idle,Lock1,Lock2,Lock3); -- States in FSM
signal present_state, next_state : lock_state; -- Current & Next State

begin 
-- Control State Change
process(clk, reset) 
begin
	if(reset = '1') then
	 present_state <= Lock1; -- Default State
	elsif (clk'event and clk = '1') then
	 present_state <= next_state; -- Change State
	end if;
end process;

-- Determine Next State 
process(clk, enter, ld1, ld2, ld3, value)
variable C1,C2,C3 : std_logic_vector(3 downto 0); -- Compare Digit
variable T_enter : std_logic_vector(3 downto 0):= "0000"; -- Test Digit
begin

-- PreStored Registers
C1 := "0111"; C2 := "0101"; C3 := "1001"; -- Combination: 7-5-9

-- 4-bit Enter 
T_enter(0) := enter;
T_enter(1) := enter;
T_enter(2) := enter;
T_enter(3) := enter;
	
 case present_state is
when Idle =>
	if (reset = '1' and present_state = Idle) then
	 unlock <= '0';
	 next_state <= Lock1; -- First Lock State
	end if;
 
when Lock1 =>
	if(ld1 = '1' and C1 = (value and T_enter))then
	  unlock <= '0';
	  next_state <= Lock2;
	else 
	  unlock <= '0';
	  next_state <= Lock1;
	end if;

 when Lock2 =>
	if(ld2 = '1' and C2 = (value and T_enter))then
	  unlock <= '0';
	  next_state <= Lock3;
	else 
	  unlock <= '0';
	  next_state <= Lock1;
	end if;

 when Lock3 =>
	if(ld3 = '1' and C3 = (value and T_enter))then
	  unlock <= '1';
	  next_state <= Idle;
	else 
	  unlock <= '0';
	  next_state <= Lock1;
	end if;
 end case;
end process;
end behaviour;

