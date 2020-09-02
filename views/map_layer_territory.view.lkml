view: map_layer_territory {
  derived_table: {
    sql: select '57198' as ZIP_CODE, '1000' as Sales
      union select '57196', '2000'
      UNION select '57197', '3000'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ZIP_CODE{
    type: string
    map_layer_name: territory
    sql: ${TABLE}."ZIP_CODE" ;;
  }

  measure: sales {
    type: sum
    sql: ${TABLE}."SALES" ;;
  }

  set: detail {
    fields: [ZIP_CODE, sales]
  }
}
