module register_file (
    input clk,              
    input reset,            
    input write_en,         
    input [1:0] addr_1,
    input [63:0] data_in,   
    output reg [63:0] data_out   
);    
reg[63:0] registers [0:3];
always @(*)
begin
	if (write_en)
	registers[addr_1] <= data_in;
end
always@(*)
begin
	data_out = registers[addr_1]; 
end
endmodule
