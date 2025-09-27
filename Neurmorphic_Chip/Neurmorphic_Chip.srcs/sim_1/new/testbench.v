library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_byte_multiplier_accumulator is
-- Testbench has no ports
end tb_byte_multiplier_accumulator;

architecture Behavioral of tb_byte_multiplier_accumulator is

    -- Component under test
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

    -- Signals
    signal clk_tb    : STD_LOGIC := '0';
    signal rst_tb    : STD_LOGIC := '1';
    signal data_tb   : STD_LOGIC_VECTOR(7 downto 0);
    signal weight_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal thres_tb  : STD_LOGIC_VECTOR(15 downto 0);
    signal P_tb      : STD_LOGIC_VECTOR(15 downto 0);
    signal spike_tb  : STD_LOGIC;

    -- Clock period
    constant CLK_PERIOD : time := 10 ns;

begin

    -- Instantiate the neuron
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

    -- Clock generation
    clk_process: process
    begin
        while true loop
            clk_tb <= '0';
            wait for CLK_PERIOD/2;
            clk_tb <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset neuron
        rst_tb <= '1';
        weight_tb <= x"05";  -- example weight = 5
        thres_tb <= x"00C8"; -- threshold = 200 decimal
        wait for 2*CLK_PERIOD;
        rst_tb <= '0';

        -- Apply random input sequence for 50 cycles
        for i in 0 to 49 loop
            -- Random 8-bit input: 0-255
            data_tb <= std_logic_vector(to_unsigned(integer(UNIFORM(0,255)), 8));
            wait for CLK_PERIOD;
        end loop;

        -- Finish simulation
        wait for 5*CLK_PERIOD;
        assert false report "Simulation finished" severity note;
        wait;
    end process;

    -- Random function using VHDL 2008 uniform (if your simulator doesn't support, use fixed sequence)
    function UNIFORM(MIN_VAL: integer; MAX_VAL: integer) return integer is
        variable seed1, seed2 : positive := 1;
        variable r : real;
    begin
        r := uniform(seed1, seed2); -- returns 0 <= r < 1
        return integer(floor(r*(MAX_VAL-MIN_VAL+1))) + MIN_VAL;
    end function;

end Behavioral;
