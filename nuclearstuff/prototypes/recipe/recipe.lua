data:extend({
  
  {
    type = "recipe",
    name = "uraninite-slurry",
    category = "crafting-with-fluid",
    energy_required = 1,
    enabled = "true",
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
    enabled = "true",
    ingredients =
    {
      {type="fluid", name="sulfuric-acid", amount=5},
      {type="fluid", name="uraninite-slurry", amount=5},
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
    enabled = "true",
    ingredients =
    {     
      {type="item", name="fluorite", amount=1} 
    },
    results=
    {
      {type="fluid", name="fluorine-gas", amount=5},
    }
  },

  {
    type = "recipe",
    name = "centrifuge",
    energy_required = 10,
    enabled = "true",
    ingredients =
    {
      {"steel-plate", 5},
      {"iron-gear-wheel", 5},
      {"electronic-circuit", 5},
      {"pipe", 5}
    },
    result= "centrifuge"
  },

})