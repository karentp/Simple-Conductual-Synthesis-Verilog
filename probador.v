//++++++++++MODULO PROBADOR PARA MUX CON MEMORIA: GENERADOR DE SEÑALES Y MONITOR DE DATOS +++++++++++++++

module probador( 
    
    input  [1:0] data_out,
    output reg clk,
    output reg reset_L,
    output reg selector,
    output reg [1:0] data_in0,
    output reg [1:0] data_in1
    
    
    );


	// Bloque de procedimiento, no sintetizable, se recorre una unica vez

	initial begin
        // Nombre de archivo del "dump"
		$dumpfile("mux_memoria.vcd");

        // Directiva para "dumpear" variables	
		$dumpvars;		
	
		// Mensaje que se imprime en consola una vez
		$display ("\t\ttiempo\t\tclk,\tselector,\treset_L,\tdata_in0,\tdata_in1,\tdata_out");

		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		$monitor($time,"\t\t%b\t%b\t\t%b\t\t%b\t\t%b\t\t%b", clk, selector, reset_L, data_in0, data_in1, data_out);

        // Asignamos valores 
		{data_in0} = 2'b00; 
        {data_in1} = 2'b00;
        {selector} = 1'b0;
        {reset_L} = 1'b0;
        
        // Repite 8 veces
		repeat (8) begin

            // Espera/sincroniza con el flanco positivo del reloj	
            @(posedge clk);	

            // Suma 1 a cada entrada
            {data_in0, data_in1} <= {data_in0, data_in1} + 1; 
            { selector, reset_L} <= {selector, reset_L} +1;
		end

		@(posedge clk);

        // Asigna un tipo bit con valor 0
        {data_in0} <= 2'b00; 
        {data_in1} <= 2'b00;
        {selector} <= 1'b0;
        {reset_L} <= 1'b0;

        // Termina de almacenar señales
		$finish;

	end

	// Reloj

    //Valor inicial del reloj para que no sea indeterminado
	initial	clk 	<= 0;	

    //Toggle cada 2*10 nano segundos		
	always	#2 clk 	<= ~clk;
    		
endmodule
