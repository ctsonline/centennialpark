connection: "ctsdev"

# include all the views
include: "centpark_water_meters.view"

datagroup: centennial_park_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: centennial_park_default_datagroup
