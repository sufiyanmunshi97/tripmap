view: map_layer_territory {
  derived_table: {
    sql: select '57198' as ZIP_CODE, '614SD' as TERRITORY_CODE, '2000' as Sales
      union select '57196','614SD', '2000'
      union select '57197','614SD', '2000'
      union select '57198','614SD', '2000'
      union select '95207','117','4000'
      union select '95208','117','4000'
      union select '95209','117','4000'
      union select '95210','117','4000'
      union select '95211','117','4000'
      union select '95212','117','4000'
      union select '95213','117','4000'
      union select '95215','117','4000'
      union select '95219','117','4000'
      union select '95220','117','4000'
      union select '95231','117','4000'
      union select '95236','117','4000'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ZIP_CODE{
    type: zipcode
    map_layer_name: territory
    sql: ${TABLE}."ZIP_CODE" ;;
  }
  dimension:TERRITORY_CODE{
    type: string
    map_layer_name: territory
    sql: ${TABLE}."TERRITORY_CODE" ;;
  }

  measure: sales {
    type: sum
    sql: ${TABLE}."SALES" ;;
  }

  set: detail {
    fields: [ZIP_CODE,TERRITORY_CODE, sales]
  }
}
