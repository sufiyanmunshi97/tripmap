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
      union select '94582','116','37.6725','-121.8891','5000'
      union select '94583','116','37.7574','-121.9521','5000'
      union select '94509','116','37.9916','-121.802','5000'
      union select '94511','116','38.0404','-121.639','5000'
      union select '94513','116','37.9321','-121.7038','5000'
      union select '94514','116','37.8477','-121.6081','5000'
      union select '94516','116','37.7772','-121.9554','5000'
      union select '94517','116','37.9235','-121.9117','5000'
      union select '94518','116','37.9541','-121.0251','5000'
      union select '94519','116','37.9843','-121.0144','5000'
      union select '94520','116','37.6863','-121.0399','5000'
      union select '94521','116','37.9578','-121.9771','5000'
      union select '94522','116','37.7772','-121.9554','5000'
      union select '94523','116','37.9517','-121.0732','5000'
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
