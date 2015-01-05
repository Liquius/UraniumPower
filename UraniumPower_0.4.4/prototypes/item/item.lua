data:extend({
  {
    type = "item",
    name = "uraninite",
    icon = "__UraniumPower__/graphics/icons/uraninite.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "d[uraninite]",
    stack_size = 50
  },
  {
    type = "item",
    name = "fluorite",
    icon = "__UraniumPower__/graphics/icons/fluorite.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "e[fluorite]",
    stack_size = 50
  },
  {
    type = "item",
    name = "yellowcake",
    icon = "__UraniumPower__/graphics/icons/yellowcake.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "f[yellowcake]",
    stack_size = 50
  },
  {
    type = "item",
    name = "pressure-pump",
    icon = "__base__/graphics/icons/small-pump.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy-pipe-distribution",
    order = "b[pipe]-c[small-pump]",
    place_result = "pressure-pump",
    stack_size = 50
  },
  {
    type = "item",
    name = "fission-reactor-fuel",
    icon = "__UraniumPower__/graphics/icons/fission-reactor-fuel.png",
    dark_background_icon = "__base__/graphics/icons/coal-dark-background.png",
    flags = {"goes-to-main-inventory"},
    fuel_value = "1.5MJ",
    subgroup = "raw-material",
    order = "b[coal]",
    stack_size = 100
  }
})