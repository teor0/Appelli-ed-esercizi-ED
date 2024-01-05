library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity App1121 is
    generic(n: integer:=8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           C : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (n downto 0));
end App1121;

architecture Behavioral of App1121 is
    signal EA,EB,NA,NB,zero,OP,p,g: std_logic_vector(n downto 0);
    signal Carry: std_logic_vector(n+1 downto 0);
begin 
    --verrà utilizzato il "trucco" ovvero A negato equivale a -A-1.
    EA<=A(n-1)&A;
    EB<=B(n-1)&B;
    NA<=not(EA);
    NB<=not(EB);
    zero<=(others=>'0');
    OP<=EA when C="00" else
        NA when C="01" else
        EB when C="10" else
        NB when C="11" else
        (others=>'X');    
    p<=OP xor zero;
    g<=OP and zero;
    Carry(0)<='1' when C="00" else
        '0' when C="01" else
        '1' when C="10" else
        '0' when C="11" else
        'X';
    Carry(n+1 downto 1)<=g or (p and Carry(n downto 0));
    S<=p xor Carry(n downto 0);
end Behavioral;
