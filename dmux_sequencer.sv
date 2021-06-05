

class dmux_sequencer extends uvm_sequencer#(dmux_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_component_utils(dmux_sequencer)  
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="dmux_sequencer",uvm_component parent);  
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
endclass:dmux_sequencer

