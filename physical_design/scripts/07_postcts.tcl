optDesign -postCTS

report_timing > physical_design/reports/place_timing.rptpostCTS_timing.rpt

report_constraint -all_violators \
> physical_design/reports/postCTS_constraints.rpt

saveDesign \
    /home/arshad/Desktop/Arshad/project3/physical_design/db/execution_unit_post_CTS.enc
