setAnalysisMode -analysisType onChipVariation
setAnalysisMode -cppr both


optDesign -postRoute

report_timing > physical_design/reports/postRoute_timing.rpt

report_constraint -all_violators \
> physical_design/reports/postRoute_constraints.rpt

saveDesign /home/arshad/Desktop/Arshad/project3/physical_design/database/09_postRoute.enc
