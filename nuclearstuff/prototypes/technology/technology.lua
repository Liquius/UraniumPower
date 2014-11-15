data:extend(
{
  {
    type = "technology",
    name = "uranium-processing",
    icon = "__NuclearStuff__/graphics/technology/uranium-processing.png",
    prerequisites = {"sulfur-processing"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "nuclear-fission-reactor"
      },
      {
        type = "unlock-recipe",
        recipe = "nuclear-fission-reactor-on"
      },
      {
        type = "unlock-recipe",
        recipe = "uraninite-slurry"
      },
      {
        type = "unlock-recipe",
        recipe = "yellowcake"
      },
      {
        type = "unlock-recipe",
        recipe = "fluorine-gas"
      },
--[[
      {
        type = "unlock-recipe",
        recipe = "centrifuge"
      },
]]
      {
        type = "unlock-recipe",
        recipe = "fuel-assembly-i"
      },
      {
        type = "unlock-recipe",
        recipe = "fuel-assembly-ii"
      },
      {
        type = "unlock-recipe",
        recipe = "fuel-assembly-iii"
      },
      {
        type = "unlock-recipe",
        recipe = "fuel-assembly-iiii"
      },
      {
        type = "unlock-recipe",
        recipe = "fuel-assembly-iiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "fuel-assembly-iiiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "fuel-assembly-iiiiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "fuel-assembly-iiiiiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "fuel-assembly-iiiiiiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-pellet-depleted"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-pellet-i"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-pellet-ii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-pellet-iii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-pellet-iiii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-pellet-iiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-pellet-iiiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-pellet-iiiiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-pellet-iiiiiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-pellet-iiiiiiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-hexafluoride"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-hexafluoride-ii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-hexafluoride-iii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-hexafluoride-iiii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-hexafluoride-iiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-hexafluoride-iiiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-hexafluoride-iiiiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-hexafluoride-iiiiiiii"
      },
      {
        type = "unlock-recipe",
        recipe = "uranium-hexafluoride-iiiiiiiii"
      }
    },
    unit =
    {
      count = 75,
      ingredients = {{"science-pack-1", 1},
                     {"science-pack-2", 1},
                     {"science-pack-3", 1}},
      time = 30
    },
    order = "d-c"
  }
})
