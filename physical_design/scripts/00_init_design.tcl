#----------------------------------------------------------
# init_design.tcl
# Design Initialization
#----------------------------------------------------------

set init_lef_file {
    /home/install/FOUNDRY/analog/90nm/lef/gpdk090.lef
    /home/install/FOUNDRY/digital/90nm/dig/lef/gsclib090_tech.lef
    /home/install/FOUNDRY/digital/90nm/dig/lef/gsclib090_macro.lef
}

set init_verilog \
/home/arshad/Desktop/Arshad/project3/synthesis/netlist/execution_unit_syn.v

set init_mmmc_file \
/home/arshad/Desktop/Arshad/project3/physical_design/scripts/setup.view

set init_top_cell execution_unit

set init_pwr_net VDD
set init_gnd_net VSS

init_design

checkDesign
