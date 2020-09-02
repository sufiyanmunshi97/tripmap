connection: "snowlooker"

include: "/views/**/*.view"

map_layer: territory {
  file:"book1.json"
  property_key: "TERRITORY_CODE"
}

explore: map_layer_territory {}
