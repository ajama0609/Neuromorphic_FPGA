# ML on FPGA Vivado
Neuromorphic Integrate-and-Fire Node — FPGA RTL Design  

This project is inspired by **Spiking Neural Networks (SNNs)**, with the goal of demonstrating how they can be implemented in digital hardware using standard FPGA resources. At the core of the design is a **Multiply-and-Accumulate (MAC) block**, followed by a comparison stage against a programmable threshold (which acts as the bias).  

<img width="1919" height="930" alt="image" src="https://github.com/user-attachments/assets/3d53a99b-fcf7-47d7-8c51-b360e243a189" /> 

<img width="1919" height="959" alt="image" src="https://github.com/user-attachments/assets/50ab60ee-7934-425a-9b6f-bd481ac53b72" />



### Key Features
- **MAC-based neuron design**: each node multiplies input data by a weight and accumulates the result over time.  
- **Threshold comparison**: when the accumulated value exceeds the threshold (bias), the neuron generates a spike and resets.  
- **Programmable parameters**: weights and thresholds can be configured externally by a microcontroller or host processor. These parameters may be learned offline and flashed onto the device, or adapted online for real-time learning.  
- **Extensible architecture**: this implementation demonstrates a single integrate-and-fire node, but can be scaled to multiple neurons. With a separate microcontroller or soft-core processor, adaptive learning algorithms could be integrated to update weights dynamically.  

This project illustrates how digital logic on an FPGA can replicate the behavior of biological spiking neurons, forming a foundation for larger neuromorphic accelerators.
