Library IEEE;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_arith.all;
Use ieee.std_logic_unsigned.all;

Entity multi is
    Generic(N : integer := 3);
    Port(
        A, B : in std_logic_vector((N-1) downto 0);
        Output : out std_logic_vector(((2*N) - 1) downto 0));
End entity;

Architecture multBehv_arch of multi is

Constant Zero : std_logic_vector((N - 1) downto 0) := (others => '0'); -- Init vector with only '0' 

Begin

mult : process (A, B) is

    Variable Result : std_logic_vector(((2*N) - 1) downto 0) := (others => '0');
    Variable Temp : std_logic_vector(((2*N) - 1) downto 0) := (others => '0');
    
    Variable i : integer := N; --Initialize the counter 
    
    
    Begin
    While (i > 0) loop 
        if (B(N-i) = '1') then -- if B(N-i) = 1 ==> process
            if (i = N) then
            
                Temp := (Zero((i-1) downto 0) & A); --> Temp = '0000...00a'
                Result :=  Result + Temp;
                i := i - 1;
                
            elsif (i = (N-1)) then
            
                Temp :=  (Zero((i-1) downto 0) & (A & '0'));
                Result :=  Result + Temp;
                i := i - 1;
                
            elsif ((i < (N-1)) and (i > 1)) then
            
                Temp :=  (Zero((i-1) downto 0) & (A & Zero(((N-i)-1) downto 0)));
                Result :=  Result + Temp;
                i := i - 1;
                
            elsif (i = 1) then 
            
                Temp :=  ('0' & (A & Zero(((N-i)-1) downto 0)));
                Result :=  Result + Temp;
                i := i - 1;
                
            end if;
        else -- Nothing otherwise
            Result :=  Result;
            i := i - 1;
        end if;
    end loop;
    
    Output <= Result; 
    Result := (others => '0');
    i := N; 

End process;

End architecture;