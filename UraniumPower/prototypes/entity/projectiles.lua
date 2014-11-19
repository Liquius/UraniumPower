data:extend({
  {
    type = "projectile",
    name = "uranium-cannon-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -1.1}, {0.05, 1.1}},
    acceleration = 0,
    direction_only = true,
    piercing_damage = 450,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion-gunshot"
          },
          {
            type = "damage",
            damage = { amount = 250 , type = "physical"}
          },
          {
            type = "damage",
            damage = { amount = 50 , type = "explosion"}
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    },
  },

})