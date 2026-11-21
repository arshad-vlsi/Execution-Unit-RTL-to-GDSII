############################################################
# 01_floorplan.tcl
############################################################

floorPlan -site gsclib090site \
           -r 1.0 0.60 10 10 10 10

saveDesign physical_design/db/execution_unit_floorplan.enc

report_area \
> physical_design/reports/floorplan_area.rpt

reportGateCount \
> physical_design/reports/floorplan_gatecount.rpt

reportDensity \
> physical_design/reports/floorplan_density.rpt

checkDesign

verifyGeometry

verifyConnectivity

saveDesign \
    /home/arshad/Desktop/Arshad/project3/physical_design/db/execution_unit_floorplan.enc
