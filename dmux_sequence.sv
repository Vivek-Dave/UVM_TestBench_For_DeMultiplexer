
/***************************************************
** class name  : dmux_sequence
** description : generate input to dut
***************************************************/
class dmux_sequence extends uvm_sequence#(dmux_sequence_item);
  //----------------------------------------------------------------------------
  `uvm_object_utils(dmux_sequence)            
  //----------------------------------------------------------------------------

  dmux_sequence_item txn;
  int unsigned LOOP=2;

  //----------------------------------------------------------------------------
  function new(string name="dmux_sequence");  
    super.new(name);
  endfunction
  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  virtual task body();
    repeat(LOOP) begin
      for(int i=0;i<8;i++) begin  
        txn=dmux_sequence_item::type_id::create("txn");
        start_item(txn);
        txn.randomize()with{txn.sel==i;};
        #5;
        finish_item(txn);
      end
    end
  endtask:body
  //----------------------------------------------------------------------------
endclass:dmux_sequence

/***************************************************
** class name  : random_sequence
** description : generate random sequence
***************************************************/
class random_sequence extends dmux_sequence;
  //----------------------------------------------------------------------------   
  `uvm_object_utils(random_sequence)      
  //----------------------------------------------------------------------------
  
  dmux_sequence_item txn;
  int unsigned LOOP = 30;
  
  //----------------------------------------------------------------------------
  function new(string name="random_sequence");
      super.new(name);
  endfunction
  //----------------------------------------------------------------------------
  
  //----------------------------------------------------------------------------
  task body();
    repeat(LOOP) begin 
      txn=dmux_sequence_item::type_id::create("txn");
      start_item(txn);
      txn.randomize();
      #5;
      finish_item(txn);
    end
  endtask:body
  //----------------------------------------------------------------------------
  
endclass