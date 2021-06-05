
class dmux_env extends uvm_env;

   //---------------------------------------------------------------------------
   `uvm_component_utils(dmux_env)
   //---------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  function new(string name="dmux_env",uvm_component parent);
    super.new(name,parent);
  endfunction
  //----------------------------------------------------------------------------

  //-------------------- class handles -----------------------------------------
  dmux_agent    agent_h;
  dmux_coverage coverage_h;
  dmux_scoreboard scoreboard_h;
  //----------------------------------------------------------------------------

  //---------------------- build phase -----------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent_h    = dmux_agent::type_id::create("agent_h",this);
    coverage_h = dmux_coverage::type_id::create("coverage_h",this);
    scoreboard_h = dmux_scoreboard::type_id::create("scoreboard_h",this);
  endfunction
  //----------------------------------------------------------------------------

  //-------------------------- connect phase -----------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent_h.monitor_h.ap_mon.connect(coverage_h.analysis_export);
    // monitor to scoreboard connection 
    agent_h.monitor_h.ap_mon.connect(scoreboard_h.aport_mon);
    // driver to scoreboard connection
    agent_h.driver_h.drv2sb.connect(scoreboard_h.aport_drv);
  endfunction
  //----------------------------------------------------------------------------
endclass:dmux_env

