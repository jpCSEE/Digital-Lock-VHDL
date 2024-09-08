LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lock IS
	PORT(	Clock, clr	:IN STD_LOGIC;
			b			:IN STD_LOGIC_VECTOR(3 downto 0);
			z			:OUT STD_LOGIC_VECTOR(1 downto 0));
END lock;

ARCHITECTURE behavior OF lock IS
	TYPE State_type IS(s0, ws0, s1, ws1, s2, ws2, s3, we0,
						e1, we1, e2, we2, e3);
	SIGNAL y:State_type;
BEGIN
	PROCESS(clr, Clock)
	BEGIN 
		IF clr = '0' THEN
			y <= s0;
		ELSIF(Clock'EVENT AND Clock = '1') THEN
			CASE y IS
				WHEN s0 =>
					IF b = "0000" THEN
						y <= s0;
					ELSIF  b = "0001" THEN
						y <= ws0;
					ELSE
						y <= we0;
					END IF;
				WHEN ws0 =>
					IF b = "0000" THEN
						y <= s1;
					END IF;
				WHEN s1 =>
					IF b = "0000" THEN
						y <= s1;
					ELSIF b = "0100" THEN
						y <= ws1;
					ELSE
						y <= we1;
					END IF;
				WHEN ws1 =>
					IF b = "0000" THEN
						y <= s2;
					END IF;
				WHEN s2 =>
					IF b = "0000" THEN
						y <= s2;
					ELSIF b = "1000" THEN
						y <= ws2;
					ELSE
						y <= we2;
					END IF;
				WHEN ws2 =>
					IF b = "0000" THEN
						y <= s3;
					END IF;
				WHEN s3 =>
					IF b = "0000" THEN
						y <= s3;
					ELSIF b = "0001" THEN
						y <= ws0;
					ELSE
						y <= we0;
					END IF;
				WHEN we0 =>
					IF b = "0000" THEN
						y <= e1;
					END IF;
				WHEN e1 =>
					IF b = "0000" THEN
						y <= e1;
					ELSE
						y <= we1;
					END IF;
				WHEN we1 =>
					IF b = "0000" THEN
						y <= e2;
					END IF;
				WHEN e2 =>
					IF b = "0000" THEN
						y <= e2;
					ELSE
						y <= we2;
					END IF;
				WHEN we2 =>
					IF b = "0000" THEN
						y <= e3;
					END IF;
				WHEN e3 =>
					IF b = "0000" THEN
						y <= e3;
					ELSIF b = "0001" THEN
						y <= ws0;
					ELSE
						y <= we0;
					END IF;
			END CASE;
		END IF;
	END PROCESS;
	
	PROCESS(y)
	BEGIN
		CASE y IS
			WHEN s3 =>
				z <= "01";
			WHEN e3 =>
				z <= "10";
			WHEN OTHERS =>
				z <= "00";
		END CASE;
	END PROCESS;
END behavior;