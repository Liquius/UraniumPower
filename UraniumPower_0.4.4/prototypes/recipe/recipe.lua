data:extend({
  {
    type = "recipe",
    name = "uraninite-slurry",
    category = "crafting-with-fluid",
    energy_required = 3,
    enabled = "false",
    ingredients =
    {
      {type="item", name="uraninite", amount=5},
      {type="fluid", name="water", amount=10}
    },
    results=
    {
      {type="fluid", name="uraninite-slurry", amount=5}
    }
  },
  {
    type = "recipe",
    name = "yellowcake",
    category = "chemistry",
    energy_required = 5,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="sulfuric-acid", amount=5},
      {type="fluid", name="uraninite-slurry", amount=10},
      {type="item", name="empty-barrel", amount=1} 
    },
    results=
    {
      {type="item", name="yellowcake", amount=1}
    }
  },
  {
    type = "recipe",
    name = "fluorine-gas",
    category = "chemistry",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {     
      {type="item", name="fluorite", amount=1} 
    },
    results=
    {
      {type="fluid", name="fluorine-gas", amount=15},
    }
  },
  {
    type = "recipe",
    name = "uranium-hexafluoride",
    category = "chemistry",
    enabled = "false",
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="fluorine-gas", amount=50},
      {type="item", name="yellowcake", amount=1}
    },
    results=
    {
      {type="item", name="empty-barrel", amount=1},
      {type="fluid", name="uranium-hexafluoride-02", amount=75}
    },
    icon = "__UraniumPower__/graphics/icons/uranium-hexafluoride.png",
    subgroup = "fluid",
    order = "a[oil-processing]-a[basic-oil-processing]"
  },
  {
    type = "recipe",
    name = "pressure-pump",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {
      {"electric-engine-unit", 1},
      {"steel-plate", 1},
      {"pipe", 1}
    },
    result= "pressure-pump"
  },
  {
    type = "recipe",
    name = "fast-pump",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {
      {"electric-engine-unit", 3},
      {"steel-plate", 3},
      {"pipe", 1}
    },
    result= "fast-pump"
  },
  {
    type = "recipe",
    name = "heat-exchanger",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {
      {"copper-plate", 10},
      {"steel-plate", 2}
    },
    result= "heat-exchanger"
  },
  {
    type = "recipe",
    name = "pressurised-water",
    category = "pressure-pump",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {     
      {type="fluid", name="water", amount=10} 
    },
    results=
    {
      {type="fluid", name="pressurised-water", amount=10},
    }
  }
})