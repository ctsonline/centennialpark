view: centpark_water_meters {
  sql_table_name: public.centpark_water_meters ;;

  dimension: Value{
    label: "Meter Values"
    type: number
    sql: ${TABLE}.v1 ;;
  }

  dimension_group: reading {
    type: time
    timeframes: [raw, date, time_of_day,month,time, hour_of_day,hour12,hour3,hour6]
    sql: cast(TIMESTAMPTZ(${TABLE}.t1) as timestamp);;
  }

  dimension_group: reading_8am {
    description: "A date starts from 8am of that day and ends before 8am of the following day."
    type: time
    timeframes: [date, hour, week, month, year]
    sql: DATEADD(hour,-8,${reading_raw}) ;;
  }

  dimension_group: t1 {
    type: time
    timeframes: [raw, date, time, hour,month,week,year]
    sql: cast(TIMESTAMPTZ(${TABLE}.t1) as timestamp) ;;
    drill_fields: [t1_hour, t1_time,t1_month,t1_week,t1_year]
  }

  dimension: d1 {
    group_label: "Digital"
    type: number
    sql: ${TABLE}.d1 ;;
  }

  dimension: d2 {
    group_label: "Digital"
    type: number
    sql: ${TABLE}.d2 ;;
  }

  dimension: r1 {
    group_label: "Relays"
    type: number
    sql: ${TABLE}.r1 ;;
  }

  dimension: r2 {
    group_label: "Relays"
    type: number
    sql: ${TABLE}.r2 ;;
  }

  dimension: r3 {
    group_label: "Relays"
    type: number
    sql: ${TABLE}.r3 ;;
  }

  dimension: r4 {
    group_label: "Relays"
    type: number
    sql: ${TABLE}.r4 ;;
  }



  dimension: client {
    type: string
    hidden: no
    sql: REPLACE(${cid},'11','CoM1') ;;
  }

  dimension: site_name {
    type: string
    hidden: no
    sql: REPLACE(${sid},'3','Yarra BBQ') ;;
  }

  dimension_group: time10{
    type: time
    timeframes: [minute10]
    sql:TIMESTAMPTZ(${TABLE}.timestamp) ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, time_of_day, date, week, month, hour_of_day, hour, hour3, minute, minute10]
    sql: TIMESTAMPTZ(${TABLE}.t1);;
    drill_fields: [timestamp_date,timestamp_hour,timestamp_week]
  }

  dimension: name {
    label: "Long Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: area {
    type: string
    sql: split_part(${name}, '.', 2) ;;
  }

  dimension: device {
    type: string
    sql: split_part(${name}, '.', 3) ;;
  }

  dimension:  application {
    type: string
    sql: split_part(${name}, '.', 5) ;;
  }

  dimension:  location {
    label: "Meter Location"
    type: string
    sql: split_part(${name}, '.',4 ) ;;
  }

  dimension:  MWM_decon {
    type: string
    sql: split_part(${name}, '.',4 ) ;;
  }

  dimension: MWM{
    type: string
    sql: split_part(${MWM_decon}, ' ',1) ;;
  }

  dimension: sid {
    label: "Site ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.sid ;;
  }

  dimension: cid {
    label: "Client ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.cid ;;
  }



### FieldUnits.Albert St 1.Meters.ALBE FM.Accumulator
### FieldUnits.Albert St 1.Meters.ALBE FM.Flow
### FieldUnits.Alex Pump.Meters.MWM BTHS DRV ALEX PMP.Flow

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: long {
    type: number
    sql: ${TABLE}.long ;;
  }




  dimension: t1 {
    label: "Date and Time"
    type: string
    sql: cast(TIMESTAMPTZ(${TABLE}.t1) as timestamp) ;;
  }

  dimension: time_numeric {
    label: "time numeric"
    type: date_time_of_day

  }

  dimension: time_8am_8am {
    label: "time 8am - 8am"
    type:string
    sql:(trunc_days(${centpark_water_meters.reading_time}) = add_days(-1,trunc_days(now())) AND extract_hours(${centpark_water_meters.reading_time}) >= 8) OR (trunc_days(${centpark_water_meters.reading_time}) = trunc_days(now()) AND extract_hours(${centpark_water_meters.reading_time}) < 8);;
  }

  dimension: v1 {
    hidden: yes
    type: number
    sql: ${TABLE}.v1 ;;
  }

  # dimension: dim.val {
  #   type: number
  #   sql: ${TABLE}.v1 ;;
  # }



  measure: min_value{
    label: "Min Meter Reading"
    type: min
    sql: ${v1} ;;
    value_format: "0.000"
  }

  measure: max_value{
    label: "Max Meter Reading"
    type: max
    sql: ${v1} ;;
    value_format: "0.000"
  }

  measure: length_of_time {
    type: date_time
    sql: ${t1} ;;
  }
  }
