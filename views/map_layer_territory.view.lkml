view: map_layer_route {
  derived_table: {
    sql: select 'Mainpath' as Route, '1' as path
       union select 'Alternative','2';;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: Route {
    type: string
    map_layer_name: route
    sql: ${TABLE}."Route" ;;
  }
  measure: path {
    type: number
    sql: ${TABLE}."path" ;;
  }

  set: detail {
    fields: [Route,path]
  }
}
