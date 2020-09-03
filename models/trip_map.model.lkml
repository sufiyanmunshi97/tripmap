connection: "snowlooker"

include: "/views/**/*.view"

map_layer: territory {
  file:"map_(2).topojson"
  property_key: "Route"

}
map_layer: alternativeterritory {
  file: "alternative.topojson"
  property_key: "Route"
}

explore: map_layer_territory {}
