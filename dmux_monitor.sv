
class dmux_monitor extends uvm_monitor;
  //----------------------------------------------------------------------------
  `uvm_component_utils(dmux_monitor)
  //----------------------------------------------------------------------------

  //------------------- constructor --------------------------------------------
  function new(string name="dmux_monitor",uvm_component parent);
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------
  
  //---------------- sequence_item class ---------------------------------------
  dmux_sequence_item  txn;
  //----------------------------------------------------------------------------
  
  //------------------------ virtual interface handle---------------------------  
  virtual interface intf vif;
  //----------------------------------------------------------------------------

  //------------------------ analysis port -------------------------------------
  uvm_analysis_port#(dmux_sequence_item) ap_mon;
  //----------------------------------------------------------------------------
  
  //------------------- build phase --------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif",vif)))
    begin
      `uvm_fatal("monitor","unable to get interface")
    end
    
    ap_mon=new("ap_mon",this);
    txn=dmux_sequence_item::type_id::create("txn",this);
  endfunction
  //----------------------------------------------------------------------------

  //-------------------- run phase ---------------------------------------------
  task run_phase(uvm_phase phase);
    forever
    begin
      sample_dut(txn); 
      ap_mon.write(txn);
    end
  endtask
  //----------------------------------------------------------------------------

  task sample_dut(output dmux_sequence_item txn);
    dmux_sequence_item t = dmux_sequence_item::type_id::create("t");
    @(vif.sel or vif.in);
    
    t.in  = vif.in;
    t.sel = vif.sel;
    t.out = vif.out;

    txn = t;
  endtask

endclass:dmux_monitor

