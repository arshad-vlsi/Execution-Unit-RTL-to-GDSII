read_lib /home/install/FOUNDRY/digital/90nm/dig/lib/slow.lib

read_hdl /home/arshad/Desktop/Arshad/project3/rtl/defines.vh
read_hdl /home/arshad/Desktop/Arshad/project3/rtl/alu.v
read_hdl /home/arshad/Desktop/Arshad/project3/rtl/instruction_decoder.v
read_hdl /home/arshad/Desktop/Arshad/project3/rtl/register_file.v
read_hdl /home/arshad/Desktop/Arshad/project3/rtl/execution_unit.v

elaborate execution_unit

read_sdc /home/arshad/Desktop/Arshad/project3/constraints/execution_unit.sdc

check_design

syn_gen
syn_map
syn_opt

report area > /home/arshad/Desktop/Arshad/project3/synthesis/reports/area.rpt
report gates > /home/arshad/Desktop/Arshad/project3/synthesis/reports/gates.rpt
report timing > /home/arshad/Desktop/Arshad/project3/synthesis/reports/timing.rpt
report power > /home/arshad/Desktop/Arshad/project3/synthesis/reports/power.rpt

write_hdl > /home/arshad/Desktop/Arshad/project3/synthesis/netlist/execution_unit_syn.v


