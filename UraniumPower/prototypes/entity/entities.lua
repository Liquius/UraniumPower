data:extend({
  {
    type = "assembling-machine",
    name = "nuclear-fission-reactor",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "nuclear-fission-reactor"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "huge-explosion",
    resistances = 
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {2, 0} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-2, 0} }}
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t3-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t3-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    collision_box = {{-1.3, -1.3}, {1.3, 1.3}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    animation =
    {
      filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/nuclear-fission-reactor.png",
      priority="high",
      width = 140,
      height = 120,
      frame_count = 1,
      shift = {0.46, 0}
    },
    crafting_categories = {"nuclear-fission-reactor"},
    crafting_speed = 0.025,
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "210kW",
    ingredient_count = 4,
    module_slots = 4,
    allowed_effects = {"speed"}
  },

--[[
  {
    type = "assembling-machine",
    name = "centrifuge",
    icon = "__base__/graphics/icons/chemical-plant.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "centrifuge"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "huge-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    module_slots = 2,
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    animation =
    {
      north =
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
        width = 156,
        height = 141,
        frame_count = 1,
        shift = {0.5, -0.078125}
      },
      west =
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
        x = 156,
        width = 156,
        height = 141,
        frame_count = 1,
        shift = {0.5, -0.078125}
      },
      south =
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
        x = 312,
        width = 156,
        height = 141,
        frame_count = 1,
        shift = {0.5, -0.078125}
      },
      east =
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
        x = 468,
        width = 156,
        height = 141,
        frame_count = 1,
        shift = {0.5, -0.078125}
      }
    },
    working_visualisations =
    {
      {
        north_position = {0.94, -0.73},
        west_position = {-0.3, 0.02},
        south_position = {-0.97, -1.47},
        east_position = {0.05, -1.46},
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-green-patch.png",
          frame_count = 35,
          width = 17,
          height = 12,
          animation_speed = 0.15
        }
      },
      {
        north_position = {1.4, -0.23},
        west_position = {-0.3, 0.55},
        south_position = {-1, -1},
        east_position = {0.05, -0.96},
        north_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-window-green-patch.png",
          frame_count = 1,
          width = 21,
          height = 10
        },
        west_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-window-green-patch.png",
          x = 21,
          frame_count = 1,
          width = 21,
          height = 10
        },
        south_animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/boiling-window-green-patch.png",
          x = 42,
          frame_count = 1,
          width = 21,
          height = 10
        }
      }
    },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/chemical-plant.ogg",
          volume = 0.8
        }
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.03 / 3.5
    },
    energy_usage = "210kW",
    ingredient_count = 4,
    crafting_categories = {"centrifuge"},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-1, -2} }}
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {1, -2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {-1, 2} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_level = 1,
        pipe_connections = {{ position = {1, 2} }}
      }
    }
  },
]]
})