library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_byte_multiplier_accumulator is
end tb_byte_multiplier_accumulator;

architecture Behavioral of tb_byte_multiplier_accumulator is

    component byte_multiplier_accumulator
        Port (
            clk    : in  STD_LOGIC;                        
            rst    : in  STD_LOGIC;                        
            data   : in  STD_LOGIC_VECTOR(7 downto 0);     
            weight : in  STD_LOGIC_VECTOR(7 downto 0);     
            thres  : in  STD_LOGIC_VECTOR(15 downto 0);    
            P      : out STD_LOGIC_VECTOR(15 downto 0);    
            spike  : out STD_LOGIC     
        );
    end component;

    signal clk_tb    : STD_LOGIC := '0';
    signal rst_tb    : STD_LOGIC := '1';
    signal data_tb   : STD_LOGIC_VECTOR(7 downto 0);
    signal weight_tb : STD_LOGIC_VECTOR(7 downto 0) := x"05"; -- example weight
    signal thres_tb  : STD_LOGIC_VECTOR(15 downto 0) := x"00C8"; -- threshold 200
    signal P_tb      : STD_LOGIC_VECTOR(15 downto 0);
    signal spike_tb  : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate neuron
    UUT: byte_multiplier_accumulator
        Port map (
            clk    => clk_tb,
            rst    => rst_tb,
            data   => data_tb,
            weight => weight_tb,
            thres  => thres_tb,
            P      => P_tb,
            spike  => spike_tb
        );

    -- Clock
    clk_process: process
    begin
        while true loop
            clk_tb <= '0'; wait for CLK_PERIOD/2;
            clk_tb <= '1'; wait for CLK_PERIOD/2;
        end loop;
    end process;

    -- Stimulus
    stim_proc: process
        variable lfsr_var : unsigned(7 downto 0) := "00000001";
    begin
        -- Reset neuron
        rst_tb <= '1';
        wait for 2*CLK_PERIOD;
        rst_tb <= '0';

        -- Generate 50 pseudo-random inputs
        for i in 0 to 49 loop
            -- LFSR update
            lfsr_var := lfsr_var(6 downto 0) & (lfsr_var(7) xor lfsr_var(5));
            data_tb <= std_logic_vector(lfsr_var);
            wait for CLK_PERIOD;
        end loop;

        -- Finish simulation
        wait for 5*CLK_PERIOD;
        assert false report "Simulation finished" severity note;
        wait;
    end process;

end Behavioral;
