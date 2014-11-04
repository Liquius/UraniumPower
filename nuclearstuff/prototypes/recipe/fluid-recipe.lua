data:extend({

  {
    type = "recipe",
    name = "uranium-hexafluoride-enrichment-ii",
    category = "centrifuge",
    enabled = "true",
    energy_required = 5,
    ingredients =
    {
      {type="fluid", name="fluorine-gas", amount=25},
      {type="item", name="yellowcake", amount=1}
    },
    results=
    {
      {type="item", name="empty-barrel", amount=1},
      {type="fluid", name="uranium-hexafluoride-ii", amount=25}
    },
    icon = "__nuclearstuff__/graphics/icons/uranium-hexafluoride-ii.png",
    subgroup = "fluid",
    order = "a[oil-processing]-a[basic-oil-processing]"
  }
})