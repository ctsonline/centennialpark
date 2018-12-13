view: cent_park_fm {
  sql_table_name: public.ctsfieldmousedata ;;


  dimension: a1 {
    group_label: "Analogs"
    type: number
    sql: ${TABLE}.a1 ;;
  }

  dimension: a2 {
    group_label: "Analogs"
    type: number
    sql: ${TABLE}.a2 ;;
  }

  dimension: a3 {
    group_label: "Analogs"
    type: number
    sql: ${TABLE}.a3 ;;
  }

  dimension: a4 {
    group_label: "Analogs"
    type: number
    sql: ${TABLE}.a4 ;;
  }


  dimension: d1 {
    group_label: "Digital"
    type: number
    sql: ${TABLE}.d1 ;;
  }

  dimension: d1_name {
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

  dimension: sid {
    label: "Site ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.sid;;
  }

  dimension: cid {
    label: "Customer ID"
    type: number
    value_format_name: id
    sql: ${TABLE}.cid ;;
  }



  dimension: date {
    label: "date"
    hidden: yes
    type: date
    sql: ${TABLE}.t1 ;;
  }

  dimension_group: timestamp {
    type:time
    timeframes: [raw, time, time_of_day,minute, hour, date, week, month,]
    sql: TIMESTAMPTZ(${TABLE}.timestamp);;
  }

  ##dimension_group: timestamp {
  ## type: time
  ##convert_tz: yes
  ##timeframes: [raw, time, time_of_day, date, hour, week, month, minute30  ]
  ##sql: convert_timezone('AEDT','AEDT', ${TABLE}.timestamp::timestamp);;
  # }


#   2017.11.14 AD at 13:31:28 AEDT

  measure: d1_count {
    type: sum
    sql: ${d1} ;;
  }

  measure:  d1_avg{
    type: average
    sql: ${d1} ;;
  }
  measure: d1_max {
    type: max
    sql: ${d1} ;;
  }

  measure: d2_max {
        type: max
    sql: ${d2} ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }

  measure: max_value_r1 {
     type: max
    sql: ${r1} ;;
  }

  measure: max_value_r2 {
       type: max
    sql: ${r2} ;;
  }

  measure: max_value_r4 {
      type: max
    sql: ${r4} ;;
  }

  measure: max_value_r3 {
      type: max
    sql: ${r3} ;;
  }

  measure: average_value_a1 {
    type: average
    sql: ${a1} ;;
  }

  measure: average_value_a2 {
    type: average
    sql: ${a2} ;;
  }

  measure: average_value_a3 {
    type: average
    sql: ${a3} ;;
  }

  measure: average_value_a4 {
    type: average
    sql: ${a4} ;;
  }

  measure: max_value_a1 {
    type: max
    sql: ${a1} ;;
  }

  measure: max_value_a2 {
    type: max
    sql: ${a2} ;;
  }

  measure: max_value_a3 {
    type: max
    sql: ${a3} ;;
  }

  measure: max_value_a4 {
    type: max
    sql: ${a4} ;;
  }

  measure: time{
    type:time
    timeframes: [raw, time, time_of_day, hour, date, week, month]
    sql: TIMESTAMPTZ(${TABLE}.timestamp);;
  }
}
