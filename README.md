# Neuromorphic_FPGA
Neuromorphic Intergrate and Fire  node FPGA RTL design  

This was inspired by spiking neural networks.Reliazing that they can implemented digitally with MAC(mutiply and accumulate blocks.  
<img width="1557" height="705" alt="image" src="https://github.com/user-attachments/assets/ce8ca15f-cbb3-4ed3-93f2-15fa08b18157" /> 

As shown above and in the source code the implementaion uses a mutiply and accumulate logic block which is then compared to a threshold , that would be equivalent to a bias.The weights would be programmble by a another chip such as a mircocontoller as well as the biases or thresholds for each weight.These weights could be learned online or offline and flashed onto the chip.This includes one IF node but it would be interesting to increase the number of neurons and build out the adaptive weighting code on a seperate processor. 


