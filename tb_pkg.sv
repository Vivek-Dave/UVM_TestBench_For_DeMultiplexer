
`ifndef TB_PKG
`define TB_PKG
`include "uvm_macros.svh"
package tb_pkg;
 import uvm_pkg::*;
 `include "dmux_sequence_item.sv"        // transaction class
 `include "dmux_sequence.sv"             // sequence class
 `include "dmux_sequencer.sv"            // sequencer class
 `include "dmux_driver.sv"               // driver class
 `include "dmux_monitor.sv"              // monitor class
 `include "dmux_agent.sv"                // agent class  
 `include "dmux_coverage.sv"             // coverage class
 `include "dmux_scoreboard.sv"           // scoreboard class
 `include "dmux_env.sv"                  // environment class

 `include "dmux_test.sv"                 // test1
 //`include "test2.sv"
 //`include "test3.sv"

endpackage
`endif 


