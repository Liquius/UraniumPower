data:extend({
  {
    type = "recipe",
    name = "nuclear-fission-reactor",
    enabled = "false",
    ingredients =
    {
      {"steel-plate", 45},
      {"iron-gear-wheel", 45},
      {"advanced-circuit", 45}
    },
    result = "nuclear-fission-reactor",
    energy_required = 15
  },

  {
    type = "recipe",
    name = "nuclear-fission-reactor-on",
    category = "nuclear-fission-reactor",
    energy_required = 1.6,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="water", amount=40}
    },
    results=
    {
      {type="fluid", name="super-heated-water", amount=40}
    }
  },

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
    energy_required = 1,
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
--[[
  {
    type = "recipe",
    name = "centrifuge",
    energy_required = 10,
    enabled = "false",
    ingredients =
    {
      {"steel-plate", 5},
      {"iron-gear-wheel", 5},
      {"electronic-circuit", 5},
      {"pipe", 5}
    },
    result= "centrifuge"
  },
]]
  {
    type = "recipe",
    name = "uranium-pellet-depleted",
    category = "crafting-with-fluid",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-depleted", amount=5}
    },
    results=
    {
      {type="item", name="uranium-pellet-depleted", amount=1}
    }
  },
--[[
  {
    type = "recipe",
    name = "uranium-pellet-i",
    category = "crafting-with-fluid",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-i", amount=5}
    },
    results=
    {
      {type="item", name="uranium-pellet-i", amount=1}
    }
  },

  {
    type = "recipe",
    name = "uranium-pellet-ii",
    category = "crafting-with-fluid",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-ii", amount=5}
    },
    results=
    {
      {type="item", name="uranium-pellet-ii", amount=1}
    }
  },

  {
    type = "recipe",
    name = "uranium-pellet-iii",
    category = "crafting-with-fluid",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iii", amount=5}
    },
    results=
    {
      {type="item", name="uranium-pellet-iii", amount=1}
    }
  },
]]
  {
    type = "recipe",
    name = "uranium-pellet-iiii",
    category = "crafting-with-fluid",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iiii", amount=5}
    },
    results=
    {
      {type="item", name="uranium-pellet-iiii", amount=1}
    }
  },

  {
    type = "recipe",
    name = "uranium-pellet-iiiii",
    category = "crafting-with-fluid",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iiiii", amount=5}
    },
    results=
    {
      {type="item", name="uranium-pellet-iiiii", amount=1}
    }
  },

  {
    type = "recipe",
    name = "uranium-pellet-iiiiii",
    category = "crafting-with-fluid",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iiiiii", amount=5}
    },
    results=
    {
      {type="item", name="uranium-pellet-iiiiii", amount=1}
    }
  },

  {
    type = "recipe",
    name = "uranium-pellet-iiiiiii",
    category = "crafting-with-fluid",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iiiiiii", amount=5}
    },
    results=
    {
      {type="item", name="uranium-pellet-iiiiiii", amount=1}
    }
  },

  {
    type = "recipe",
    name = "uranium-pellet-iiiiiiii",
    category = "crafting-with-fluid",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iiiiiiii", amount=5}
    },
    results=
    {
      {type="item", name="uranium-pellet-iiiiiiii", amount=1}
    }
  },

  {
    type = "recipe",
    name = "uranium-pellet-iiiiiiiii",
    category = "crafting-with-fluid",
    energy_required = 1,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iiiiiiiii", amount=5}
    },
    results=
    {
      {type="item", name="uranium-pellet-iiiiiiiii", amount=1}
    }
  },

})