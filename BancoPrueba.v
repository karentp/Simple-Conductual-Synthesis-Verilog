//++++++++++MODULO PROBADOR PARA MUX CON MEMORIA: GENERADOR DE SEÑALES Y MONITOR DE DATOS +++++++++++++++


`timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precisi�n

// includes de archivos de verilog

`include "mux_memoria.v"
`include "probador.v"

 // Testbench
module BancoPruebas;
	
    wire clk, selector, reset_L;
	wire [1:0] data_in0, data_in1, data_out;

	// Descripcion conductual del MUX con memoria
	mux_memoria	mux( .clk(clk), .selector(selector), .reset_L(reset_L), 
                             .data_in0(data_in0), .data_in1(data_in1), .data_out(data_out) );


	// Probador: generador de señales y monitor
	probador 	prob( .clk(clk), .selector(selector), .reset_L(reset_L), 
                             .data_in0(data_in0), .data_in1(data_in1), .data_out(data_out));

endmodule