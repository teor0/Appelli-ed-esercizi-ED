library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Alt0219 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           C : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end Alt0219;

architecture Behavioral of Alt0219 is

    signal EA,p,g,B,O,Reg: std_logic_vector(8 downto 0);
    signal Carry: std_logic_vector(9 downto 0);

begin
    EA<=A(7)&A;
    B<=(0=>'1',others=>'0') when C='0' else 
       (1=>'1',others=>'0') when C='1' else
       (others=>'X');
    Carry(0)<='0';
    p<=EA xor B;
    g<=EA and B;
    Carry(9 downto 1)<=g or (p and Carry(8 downto 0));
    O<=p xor Carry(8 downto 0);
    process(Clk) begin
        if(falling_edge(Clk))then
            Reg<=O;
        end if;
    end process;
    S<=Reg;
end Behavioral;
