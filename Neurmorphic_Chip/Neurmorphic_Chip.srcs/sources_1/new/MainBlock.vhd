library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity byte_multiplier_accumulator is
    Port (
        clk    : in  STD_LOGIC;                        
        rst    : in  STD_LOGIC;                        
        data   : in  STD_LOGIC_VECTOR(7 downto 0);     
        weight : in  STD_LOGIC_VECTOR(7 downto 0);     
        thres  : in  STD_LOGIC_VECTOR(15 downto 0);    -- threshold = bias
        P      : out STD_LOGIC_VECTOR(15 downto 0);    
        spike  : out STD_LOGIC     
    );
end byte_multiplier_accumulator;

architecture Behavioral of byte_multiplier_accumulator is
    signal product : unsigned(15 downto 0);        
    signal accum   : unsigned(15 downto 0) := (others => '0'); 
    signal spike_i : std_logic := '0';
begin

    -- Compute product combinationally
    product <= unsigned(data) * unsigned(weight);

    -- Sequential accumulation with reset-on-spike
    process(clk, rst)
    begin
        if rst = '1' then
            accum   <= (others => '0');
            spike_i <= '0';
        elsif rising_edge(clk) then
            if spike_i = '1' then
                -- Clear accumulator after spike
                accum <= (others => '0');
                spike_i <= '0';
            else
                accum <= accum + product;
                if accum + product > unsigned(thres) then
                    spike_i <= '1';
                else
                    spike_i <= '0';
                end if;
            end if;
        end if;
    end process;

    -- Output assignment
    P     <= std_logic_vector(accum);
    spike <= spike_i;

end Behavioral;
