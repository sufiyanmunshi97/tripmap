view: map_layer_territory {
  derived_table: {
    sql: select '614SD' as TERRITORY_CODE, '1000' as Sales
      union select '117', '2000'
      UNION select '106', '3000'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: TERRITORY_CODE {
    type: string
    map_layer_name: territory
    sql: ${TABLE}."TERRITORY_CODE" ;;
  }

  measure: sales {
    type: sum
    sql: ${TABLE}."SALES" ;;
  }

  set: detail {
    fields: [TERRITORY_CODE, sales]
  }
}
