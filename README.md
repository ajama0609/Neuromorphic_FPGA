# Neuromorphic FPGA  
Neuromorphic Integrate-and-Fire Node — FPGA RTL Design  

This project is inspired by **Spiking Neural Networks (SNNs)**, with the goal of demonstrating how they can be implemented in digital hardware using standard FPGA resources. At the core of the design is a **Multiply-and-Accumulate (MAC) block**, followed by a comparison stage against a programmable threshold (which acts as the bias).  

<img width="1558" height="709" alt="image" src="https://github.com/user-attachments/assets/f7a50bfd-7afd-4177-bb64-c743641a0dbb" />

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/6ee5d67c-ef91-4b96-a3cb-1e4e9e044145" />

### Key Features
- **MAC-based neuron design**: each node multiplies input data by a weight and accumulates the result over time.  
- **Threshold comparison**: when the accumulated value exceeds the threshold (bias), the neuron generates a spike and resets.  
- **Programmable parameters**: weights and thresholds can be configured externally by a microcontroller or host processor. These parameters may be learned offline and flashed onto the device, or adapted online for real-time learning.  
- **Extensible architecture**: this implementation demonstrates a single integrate-and-fire node, but can be scaled to multiple neurons. With a separate microcontroller or soft-core processor, adaptive learning algorithms could be integrated to update weights dynamically.  

This project illustrates how digital logic on an FPGA can replicate the behavior of biological spiking neurons, forming a foundation for larger neuromorphic accelerators.
