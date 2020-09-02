connection: "snowlooker"

include: "/views/**/*.view"

map_layer: territory {
  file:"book1.json"
  property_key: "ZIP_CODE"
}

explore: map_layer_territory {}
