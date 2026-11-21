#----------------------------------------------------------
# io_pins.tcl
# IO Pin Placement
#----------------------------------------------------------

editPin \
-fixOverlap true \
-side LEFT \
-layer M2 \
-spreadType SIDE \
-pin {instruction*}

editPin \
-fixOverlap true \
-side RIGHT \
-layer M2 \
-spreadType SIDE \
-pin {alu_result* zero}

editPin \
-fixOverlap true \
-side TOP \
-layer M2 \
-spreadType SIDE \
-pin {clk rst reg_write init_write}

editPin \
-fixOverlap true \
-side BOTTOM \
-layer M2 \
-spreadType SIDE \
-pin {init_addr* init_data*}

saveDesign \
/home/arshad/Desktop/Arshad/project3/physical_design/db/execution_unit_io.enc
