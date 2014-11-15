data:extend({

  {
    type = "recipe",
    name = "uranium-hexafluoride",
    category = "chemistry",
    enabled = "true",
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="fluorine-gas", amount=50},
      {type="item", name="yellowcake", amount=1}
    },
    results=
    {
      {type="item", name="empty-barrel", amount=1},
      {type="fluid", name="uranium-hexafluoride-ii", amount=50}
    },
    icon = "__NuclearStuff__/graphics/icons/uranium-hexafluoride.png",
    subgroup = "fluid",
    order = "a[oil-processing]-a[basic-oil-processing]"
  },

  {
    type = "recipe",
    name = "uranium-hexafluoride-ii",
    category = "chemistry",
    enabled = "true",
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-i", amount=20},
    },
    results=
    {
      {type="fluid", name="uranium-hexafluoride-ii", amount=5},
      {type="fluid", name="uranium-hexafluoride-depleted", amount=15}
    },
    icon = "__NuclearStuff__/graphics/icons/uranium-hexafluoride-ii.png",
    subgroup = "fluid",
    order = "a[oil-processing]-a[basic-oil-processing]"
  },

  {
    type = "recipe",
    name = "uranium-hexafluoride-iii",
    category = "chemistry",
    enabled = "true",
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-ii", amount=20},
    },
    results=
    {
      {type="fluid", name="uranium-hexafluoride-iii", amount=10},
      {type="fluid", name="uranium-hexafluoride-i", amount=10}
    },
    icon = "__NuclearStuff__/graphics/icons/uranium-hexafluoride-iii.png",
    subgroup = "fluid",
    order = "a[oil-processing]-a[basic-oil-processing]"
  },

  {
    type = "recipe",
    name = "uranium-hexafluoride-iiii",
    category = "chemistry",
    enabled = "true",
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iii", amount=20},
    },
    results=
    {
      {type="fluid", name="uranium-hexafluoride-iiii", amount=10},
      {type="fluid", name="uranium-hexafluoride-ii", amount=10}
    },
    icon = "__NuclearStuff__/graphics/icons/uranium-hexafluoride-iiii.png",
    subgroup = "fluid",
    order = "a[oil-processing]-a[basic-oil-processing]"
  },

  {
    type = "recipe",
    name = "uranium-hexafluoride-iiiii",
    category = "chemistry",
    enabled = "true",
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iiii", amount=20},
    },
    results=
    {
      {type="fluid", name="uranium-hexafluoride-iiiii", amount=10},
      {type="fluid", name="uranium-hexafluoride-iii", amount=10}
    },
    icon = "__NuclearStuff__/graphics/icons/uranium-hexafluoride-iiiii.png",
    subgroup = "fluid",
    order = "a[oil-processing]-a[basic-oil-processing]"
  },

  {
    type = "recipe",
    name = "uranium-hexafluoride-iiiiii",
    category = "chemistry",
    enabled = "true",
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iiiii", amount=20},
    },
    results=
    {
      {type="fluid", name="uranium-hexafluoride-iiiiii", amount=10},
      {type="fluid", name="uranium-hexafluoride-iiii", amount=10}
    },
    icon = "__NuclearStuff__/graphics/icons/uranium-hexafluoride-iiiiii.png",
    subgroup = "fluid",
    order = "a[oil-processing]-a[basic-oil-processing]"
  },

  {
    type = "recipe",
    name = "uranium-hexafluoride-iiiiiii",
    category = "chemistry",
    enabled = "true",
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iiiiii", amount=20},
    },
    results=
    {
      {type="fluid", name="uranium-hexafluoride-iiiiiii", amount=10},
      {type="fluid", name="uranium-hexafluoride-iiiii", amount=10}
    },
    icon = "__NuclearStuff__/graphics/icons/uranium-hexafluoride-iiiiiii.png",
    subgroup = "fluid",
    order = "a[oil-processing]-a[basic-oil-processing]"
  },

  {
    type = "recipe",
    name = "uranium-hexafluoride-iiiiiiii",
    category = "chemistry",
    enabled = "true",
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iiiiiii", amount=20},
    },
    results=
    {
      {type="fluid", name="uranium-hexafluoride-iiiiiiii", amount=10},
      {type="fluid", name="uranium-hexafluoride-iiiiii", amount=10}
    },
    icon = "__NuclearStuff__/graphics/icons/uranium-hexafluoride-iiiiiiii.png",
    subgroup = "fluid",
    order = "a[oil-processing]-a[basic-oil-processing]"
  },

  {
    type = "recipe",
    name = "uranium-hexafluoride-iiiiiiiii",
    category = "chemistry",
    enabled = "true",
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="uranium-hexafluoride-iiiiiiii", amount=20},
    },
    results=
    {
      {type="fluid", name="uranium-hexafluoride-iiiiiiiii", amount=10},
      {type="fluid", name="uranium-hexafluoride-iiiiiii", amount=10}
    },
    icon = "__NuclearStuff__/graphics/icons/uranium-hexafluoride-iiiiiiiii.png",
    subgroup = "fluid",
    order = "a[oil-processing]-a[basic-oil-processing]"
  },
})