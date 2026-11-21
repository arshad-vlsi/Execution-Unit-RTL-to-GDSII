optDesign -preCTS

report_timing > physical_design/reports/preCTS_timing.rpt

report_constraint -all_violators \
> physical_design/reports/preCTS_constraints.rpt

saveDesign \
    /home/arshad/Desktop/Arshad/project3/physical_design/db/execution_unit_preCTS.enc

