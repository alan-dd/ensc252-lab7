LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity MorseGenerator is
port(m_clk: in std_logic;
		PulseOut: out std_logic);
end MorseGenerator;

architecture logic of MorseGenerator is
SIGNAL reg : signed(13 downto 0);
SIGNAL SlowClock : std_logic;
SIGNAL sequence : unsigned(5 downto 0);

BEGIN

	slowClock <= reg(13);
	
	process(reg) is
	
	begin
		if(rising_edge(m_clk)) then
			reg <= (reg+1);
		end if;		
	end process;	

	
	
	PROCESS(slowClock) is
	begin
	IF (rising_edge(slowClock)) THEN
		if sequence = "000000" then	--00
			sequence <= "100001";	--33
		else
			sequence <= (sequence-1);
		end if;
	end if;
end process;
	
	with sequence select	
	PulseOut <= '1' when "100001",	--33, 31, 29
					'1' when "011111",
					'1' when "011101",
					
					'1' when "011001",	--25, 24, 23
					'1' when "011000",
					'1' when "010111",
					
					'1' when "010101",	--21,20,19
					'1' when "010100",
					'1' when "010011",
					
					'1' when "010001",	--17,16,15
					'1' when "011000",
					'1' when "001111",
					
					'1' when "001011",	--11,09,07
					'1' when "001001",
					'1' when "000111",
					
					'0' when others;
					

End logic; 