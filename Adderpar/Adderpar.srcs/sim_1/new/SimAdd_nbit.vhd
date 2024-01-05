library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
entity SimAdd_nbit is
generic(n: integer:=8);
--  Port ( );
end SimAdd_nbit;

architecture Behavioral of SimAdd_nbit is
component Add_nbit is
    --generic (n:integer:=8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (n downto 0));
end component;
signal IA :  STD_LOGIC_VECTOR (n-1 downto 0);
signal IB :  STD_LOGIC_VECTOR (n-1 downto 0);
signal Icin : STD_LOGIC;
signal OS : STD_LOGIC_VECTOR (n downto 0);
signal TrueRis, Error:integer;
begin
  --usiamo il generic map per specificare il valore dei parametri che usiamo
  circ: Add_nbit port map(IA,IB,Icin,OS);--qui specifichiamo il valore di n
    --dopo la sintesi bisogna rimuovere generic map
  Icin<='0';
  process
  begin
    for va in -(2**(n-1)) to (2**(n-1)-1) loop
        IA<=conv_std_logic_vector(va,n);
        for vb in -(2**(n-1)) to (2**(n-1)-1) loop          
            IB<=conv_std_logic_vector(vb,n);
            TrueRis<=va+vb;
            wait for 10ns;
        end loop;
    end loop;
  end process;
  Error<=TrueRis-conv_integer(signed(OS));
end Behavioral;