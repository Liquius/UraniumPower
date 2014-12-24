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
    name = "nuclear-fission-reactor-kit",
    icon = "__UraniumPower__/graphics/icons/nuclear-fission-reactor.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "f[nuclear-fission-reactor]",
    place_result = "nuclear-fission-reactor-kit",
    stack_size = 10
  },
  {
    type = "item",
    name = "fission-reactor-3-by-3",
    icon = "__UraniumPower__/graphics/icons/nuclear-fission-reactor.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "f[nuclear-fission-reactor]",
    place_result = "fission-reactor-3-by-3",
    stack_size = 10
  },
})