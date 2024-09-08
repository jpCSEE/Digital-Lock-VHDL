library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity digital_lock is
    Port ( clock : in STD_LOGIC;
           clr : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (3 downto 0);
           z : out STD_LOGIC_VECTOR (1 downto 0));
end digital_lock;

architecture Structure of digital_lock is
	SIGNAL lock_in: STD_LOGIC_VECTOR(3 downto 0);	
	COMPONENT lock
		PORT(	Clock, clr	:IN STD_LOGIC;
			b			:IN STD_LOGIC_VECTOR(3 downto 0);
			z			:OUT STD_LOGIC_VECTOR(1 downto 0));
	END COMPONENT;
	COMPONENT debounce
		Port ( clock, clr: in STD_LOGIC;
		inp : in std_logic_vector(3 downto 0);
		outp : out STD_LOGIC_vector(3 downto 0) );
	END COMPONENT;
begin
	circuit1: debounce PORT MAP(clock=>clock, clr=>clr, inp=>btn, outp=>lock_in);
	circuit2: lock PORT MAP(clock=>clock, clr=>clr, b=>lock_in, z=>z);
end Structure;
