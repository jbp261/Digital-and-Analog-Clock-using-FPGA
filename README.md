# Digital and Analog Clock using FPGA

### Author
- Jay Patel
- Ben Walker

### Abstract 
In the project, I and Ben built a digital Clock  (24 HR & 12 HR), Quad Seven Segment Display (QSSD) clock, analog clock, jumping and bouncing digital clock. All the clocks except QSSD clock were made to display on a screen through VGA port available on the FPGA board. The QSSD clock was visible on the LEDs present on the FPGA board. The project uses embedded programmed file to manipulate each pixel of the screen. The specification of the screen was 800x600 at 60Hz. 

### Equipment
- Digilent Basys3 board (Xilinx Artix 7 FPGA)
![FPGA Board](https://raw.githubusercontent.com/jbp261/Digital-and-Analog-Clock-using-FPGA/master/Digilent_Basys-3.jpg "FPGA Board")

### Environment
- Xilinx Vivado 2016.2 Webpack Edition
- Font Engine

### Theory Topics
- FPGA Design and Programming
- Embadded Programming

### Example
The flowchart of the embedded coding used in .psm file. 

![Flow Chart](https://raw.githubusercontent.com/jbp261/Digital-and-Analog-Clock-using-FPGA/master/FlowDiagram.png "Flow Chart")

Using font engine, unicode fonts are converted to a binary image similar to ASCII art as shown below.

![Font Engine Example](https://raw.githubusercontent.com/jbp261/Digital-and-Analog-Clock-using-FPGA/master/Font%20Engine%20Example.png "Font Engine Example")

The screen shots of the outcome of the project. 


### Referance
- [EE178 Class Website](http://www.eric.crabill.org/ "EE178 Class Website")
- [Link to all project files needed to test the project in Vivado IDE](https://drive.google.com/file/d/1EreMFa1yI0yiv8cvocTURvwBgAH35EY7/view?usp=sharing "Link to all project files needed to test the project in Vivado IDE")

