connection: "snowlooker"

include: "/views/**/*.view"

map_layer: territory {
  file:"map_(6).topojson"
  property_key: "Route"

}


explore: map_layer_territory {}
