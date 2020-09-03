view: map_layer_territory {
  derived_table: {
    sql: select 'main_path' as Route, '1' as path
      union select 'alternative', '2'
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

  measure: path {
    type: sum
    sql: ${TABLE}."path" ;;
  }

  set: detail {
    fields: [Route,path]
  }
}
