data:extend(
{
  {
    type = "fluid",
    name = "uraninite-slurry",
    default_temperature = 25,
    heat_capacity = "1KJ",
    base_color = {r=0, g=0, b=0},
    flow_color = {r=0.139, g=0.139, b=0.000},
    max_temperature = 100,
    icon = "__nuclearstuff__/graphics/icons/uraninite-slurry.png",
    pressure_to_speed_ratio = 0.4,
    flow_to_energy_ratio = 0.59,
    order = "a[fluid]-b[uraninite-slurry]"
  }
})