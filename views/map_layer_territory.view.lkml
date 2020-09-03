view: map_layer_territory {
  derived_table: {
    sql: select 'main_path' as Route
      union select 'alternative'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: Route {
    type: string
    map_layer_name: territory
    sql: ${TABLE}."Route" ;;
  }


  set: detail {
    fields: [Route]
  }
}
