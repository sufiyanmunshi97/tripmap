connection: "snowlooker"

include: "/views/**/*.view"

map_layer: route {
  file:"map_(6).topojson"
  property_key: "Route"

}


explore: map_layer_route {}
