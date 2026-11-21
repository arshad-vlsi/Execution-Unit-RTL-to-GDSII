
globalNetConnect VDD -type pgpin -pin VDD -inst *
globalNetConnect VSS -type pgpin -pin VSS -inst *

addRing \
-type core_rings \
-follow core \
-nets {VDD VSS} \
-layer {top Metal5 bottom Metal5 left Metal4 right Metal4} \
-width 2 \
-spacing 1 \
-offset 2

addStripe \
-nets {VDD VSS} \
-layer Metal4 \
-width 1.5 \
-spacing 0.8 \
-set_to_set_distance 40 \
-start_offset 20

sroute

verifyConnectivity

saveDesign \
    /home/arshad/Desktop/Arshad/project3/physical_design/db/execution_unit_powerplan.enc
