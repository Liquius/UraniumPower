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
    name = "fission-reactor-chest",
    icon = "__base__/graphics/icons/steel-chest.png",
    flags = {"goes-to-quickbar"},
    subgroup = "storage",
    order = "a[items]-c[steel-chest]",
    place_result = "fission-reactor-chest",
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
  }
})