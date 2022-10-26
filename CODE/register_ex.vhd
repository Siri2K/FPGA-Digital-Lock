-- Access Library
library ieee;
use ieee.std_logic_1164.all;

-- Create Entity
entity fsm is
port
(
	reset : in std_logic;
	input : in std_logic;
	output : out std_logic;
	clk : in std_logic;
);
end;

-- Create Architecture
architecture behaviour of fsm is
type state_type is (s0,s1,s2,s3); -- Type of State Machine
signal current_state, next_state : state_type; -- Current and Next Sate Declaration


-- Control State Change
process(clk, reset)
begin
	if(reset = '1') then 
	 current_state <= s0; -- Default State
	else if (clk'event and clk = '1') then
	 current_state <= next_state; -- Change State
	end if;
end process;

-- Control State Change Conditions
process(clk, input)
begin
case current_state is
 when s0 =>
 if(input = '0') then 
  output <= '0'
  next_state <= s1;
 else 
  output <= '1'
  next_state <= s2;
  end if;
  
 when s1 =>
 if(input = '0') then 
  output <= '0'
  next_state <= s3;
 else 
  output <= '0'
  next_state <= s1;
  end if;
  
 when s2 =>
 if(input = '0') then 
  output <= '1'
  next_state <= s2;
 else 
  output <= '0'
  next_state <= s3;
  end if;
  
 when s3 =>
 if(input = '0') then 
  output <= '1'
  next_state <= s3;
 else 
  output <= '1'
  next_state <= s0;
  end if;
 
end case;

	
end process;

end behaviour;
