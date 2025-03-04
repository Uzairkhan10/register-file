module tb_register_file;
	reg clk;
	reg reset;
	reg write_en;
	reg [1:0] addr_1;
	reg [63:0] data_in;
	wire [63:0] data_out;

    
register_file register_file_inst (
	.clk			(clk),
	.reset			(reset),
	.write_en		(write_en),
	.addr_1			(addr_1),
	.data_in		(data_in),
	.data_out		(data_out)
    );
	
 
always@(posedge clk)
begin
	clk=0;
	forever #4 clk =~ clk;	
end


initial begin
$dumpfile("waveform.vcd");
$dumpvars(1,tb_register_file);
clk = 1;
reset = 1;
@(posedge clk)
reset = 0;

@(posedge clk)
write_en = 1;
addr_1 = 2'b00;
data_in = 64'd15;
#1;
$display("Data from register 0: %d", data_out);

@(posedge clk)
addr_1 = 2'b01;
data_in = 64'd20;
#1;
$display("Data from register 1: %d", data_out);

@(posedge clk)
addr_1 = 2'b10;
data_in = 64'd25;
#1;
$display("Data from register 2: %d", data_out);

@(posedge clk)
addr_1 = 2'b11;
data_in = 64'd30;
#1;
$display("Data from register 3: %d", data_out);
repeat(5) @(posedge clk);


//@(posedge clk)
//addr_1 = 2'b00;
//#1;
//$display("Data from register 0: %d", data_out);


/*
@(posedge clk)
addr_2 = 2'b01;
data_in = 64'd20;
@(posedge clk)
addr_2 = 2'b10;
data_in = 64'd25;
@(posedge clk)
addr_2 = 2'b11;
data_in = 64'd30;
repeat(20) @(posedge clk);
*/


@(posedge clk)
addr_1 = 2'b00;
data_in = 64'd50;
repeat(5) @(posedge clk);
$display("Data from register 0: %d", data_out);
repeat(2) @(posedge clk);

@(posedge clk)
addr_1 = 2'b01;
data_in = 64'd55;
repeat(5) @(posedge clk);
$display("Data from register 1: %d", data_out);
repeat(2) @(posedge clk);

@(posedge clk)
addr_1 = 2'b10;
data_in = 64'd60;
repeat(5) @(posedge clk);
$display("Data from register 2: %d", data_out);
repeat(2) @(posedge clk);

addr_1 = 2'b11;
data_in = 64'd65;
repeat(20) @(posedge clk);
$display("Data from register 3: %d", data_out);
@(posedge clk)
write_en = 0;
$finish;
end
endmodule
