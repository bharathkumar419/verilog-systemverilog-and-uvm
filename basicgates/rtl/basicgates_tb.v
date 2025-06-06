module basic_gates_tb();
  // Inputs (stimulus)
  reg A, B, C;
  // Outputs (monitor)
  wire P, Q, R, S, T, U;

  // Instantiate DUT
  basic_gates uut (
    .A(A), .B(B), .C(C),
    .P(P), .Q(Q), .R(R), .S(S), .T(T), .U(U)
  );

  // Task to apply inputs and log results
  task apply_test;
    input [2:0] test_input;  // 3-bit input {A, B, C}
    begin
      {A, B, C} = test_input;  // Assign inputs
      #100;                    // Wait for propagation
      $display("Time=%0t A=%b B=%b C=%b | P=%b Q=%b R=%b S=%b T=%b U=%b",
               $time, A, B, C, P, Q, R, S, T, U);
    end
  endtask

  // Initialize waveform dumping
  initial begin
    $dumpfile("waves.vcd");
    $dumpvars(0, basic_gates_tb);
  end

  // Main test sequence
  initial begin
    // Test all 8 possible input combinations
    apply_test(3'b000);  // 000
    apply_test(3'b001);  // 001
    apply_test(3'b010);  // 010
    apply_test(3'b011);  // 011
    apply_test(3'b100);  // 100
    apply_test(3'b101);  // 101
    apply_test(3'b110);  // 110
    apply_test(3'b111);  // 111
    $finish;
  end
endmodule
