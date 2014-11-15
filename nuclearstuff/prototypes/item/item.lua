data:extend({
  {
    type = "item",
    name = "uraninite",
    icon = "__NuclearStuff__/graphics/icons/uraninite.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "d[uraninite]",
    stack_size = 50
  },
  {
    type = "item",
    name = "fluorite",
    icon = "__NuclearStuff__/graphics/icons/fluorite.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-resource",
    order = "e[fluorite]",
    stack_size = 50
  },
  {
    type = "item",
    name = "yellowcake",
    icon = "__NuclearStuff__/graphics/icons/yellowcake.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "raw-material",
    order = "f[yellowcake]",
    stack_size = 50
  },
  {
    type = "item",
    name = "centrifuge",
    icon = "__base__/graphics/icons/chemical-plant.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "f[centrifuge]",
    place_result = "centrifuge",
    stack_size = 10
  },
  {
    type = "item",
    name = "nuclear-fission-reactor",
    icon = "__NuclearStuff__/graphics/icons/nuclear-fission-reactor.png",
    flags = {"goes-to-quickbar"},
    subgroup = "production-machine",
    order = "f[nuclear-fission-reactor]",
    place_result = "nuclear-fission-reactor",
    stack_size = 10
  },
})