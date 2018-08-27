connection: "ctsdev"

# include all the views
include: "*.view"

# include all the dashboards
#include: "*.dashboard"


##persist_with: centennial_park_default_datagroup

explore: centpark_water_meters {
  label: "CentPark Water Meters"
}

explore: centpark_bores {
  label: "CentPark bores"
}

explore: centpark_lights {
  label: "CentPark Lights"
}
