view: map_layer_territory {
  derived_table: {
    sql: select '57198' as "ZIP_CODE", '614SD' as "TERRITORY_CODE",'43.6746' as "Latitude",'-96.7913' as "Longitude", '2000' as Sales
      union select '57196','614SD','43.6746','-96.7913','2000'
      union select '57197','614SD','43.6746','-96.7913','2000'
      union select '57198','614SD','43.6746','-96.7913', '2000'
      union select '95207','117','38.0042','-121.3237','4000'
      union select '95208','117','37.8898','-121.2539','4000'
      union select '95209','117','38.0355','-121.3438','4000'
      union select '95210','117','38.0251', '-121.2972','4000'
      union select '95211','117','37.9811','-121.308','4000'
      union select '95212','117','38.0389','-121.2421','4000'
      union select '95213','117','37.9048','-121.2268','4000'
      union select '95215','117','37.9555','-121.1906','4000'
      union select '95219','117','38.0049','-121.4002','4000'
      union select '95220','117','38.2002','-121.2351','4000'
      union select '95231','117','37.8827','-121.2798','4000'
      union select '95236','117','38.0185','-121.0568','4000'
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

  dimension:Latitude{
    type: location
    map_layer_name: territory
    sql_latitude: ${TABLE}."Latitude" ;;
    sql_longitude: ${TABLE}."Longitude" ;;
  }


  measure: sales {
    type: sum
    sql: ${TABLE}."SALES" ;;
  }

  set: detail {
    fields: [ZIP_CODE,TERRITORY_CODE,Latitude, sales]
  }
}
