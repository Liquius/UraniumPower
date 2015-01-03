require "defines"
require "util"



fuelAssemblyValue01 = 0.500
fuelAssemblyValue02 = 1.000
fuelAssemblyValue03 = 1.500
fuelAssemblyValue04 = 2.000
fuelAssemblyValue05 = 2.500
fuelAssemblyValue06 = 3.000
fuelAssemblyValue07 = 3.500
fuelAssemblyValue08 = 4.000
fuelAssemblyValue09 = 4.500
fuelAssemblyValue10 = 5.000




local tickingA = 59
local tickingB = 14


game.onevent(defines.events.ontick, function(event)
	if tickingA == 0 then
		tickingA = 59
		calculate_fuel_amount()
	else
		tickingA = tickingA - 1
	end
	if tickingB == 0 then
		tickingB = 29
		add_reactor_fuel()
	else
		tickingB = tickingB - 1
	end
end)


game.onevent(defines.events.onbuiltentity, function(event)
	local x1 = event.createdentity.position.x-1
	local y1 = event.createdentity.position.y-1
	local x2 = x1+2
	local y2 = y1+2

	if event.createdentity.name == "nuclear-fission-reactor-3-by-3" then
		local player = game.getplayer(event.playerindex)
		event.createdentity.operable = false
		game.player.insert({name = "nuclear-fission-reactor-chest-9", count = 1})
		game.player.print("Place the reactor access port next to the fission reactor.")
	elseif event.createdentity.name == "nuclear-fission-reactor-5-by-5" then
		local player = game.getplayer(event.playerindex)
		event.createdentity.operable = false
		game.player.insert({name = "nuclear-fission-reactor-chest-25", count = 1})
		game.player.print("Place the reactor access port next to the fission reactor.")
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-9" then
		results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-3-by-3"}
		local player = game.getplayer(event.playerindex)
		if #results == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true, true}
			reactorAndChest[1] = results[1]
			reactorAndChest[2] = event.createdentity
			reactorAndChest[3] = 0
			table.insert(glob.LReactorAndChest, reactorAndChest)
			game.player.print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
		else
			event.createdentity.destroy()
			game.player.insert({name = "nuclear-fission-reactor-chest-9", count = 1})
			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-25" then
		results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-5-by-5"}
		local player = game.getplayer(event.playerindex)
		if #results == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true, true}
			reactorAndChest[1] = results[1]
			reactorAndChest[2] = event.createdentity
			reactorAndChest[3] = 0
			table.insert(glob.LReactorAndChest, reactorAndChest)
			game.player.print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
		else
			event.createdentity.destroy()
			game.player.insert({name = "nuclear-fission-reactor-chest-25", count = 1})
			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory.")
		end
	end
end)


function calculate_fuel_amount()
	if glob.LReactorAndChest ~= nil then
		for k,LReactorAndChest in pairs(glob.LReactorAndChest) do
			if LReactorAndChest[1].valid and LReactorAndChest[2].valid then
				if LReactorAndChest[2].getinventory(1).isempty() == false then
					local chest = LReactorAndChest[2].getinventory(1)
					LReactorAndChest[3] = 0
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue01 * (chest.getitemcount("fuel-assembly-01"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue02 * (chest.getitemcount("fuel-assembly-02"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue03 * (chest.getitemcount("fuel-assembly-03"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue04 * (chest.getitemcount("fuel-assembly-04"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue05 * (chest.getitemcount("fuel-assembly-05"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue06 * (chest.getitemcount("fuel-assembly-06"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue07 * (chest.getitemcount("fuel-assembly-07"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue08 * (chest.getitemcount("fuel-assembly-08"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue09 * (chest.getitemcount("fuel-assembly-09"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue10 * (chest.getitemcount("fuel-assembly-10"))
					LReactorAndChest[3] = math.floor(LReactorAndChest[3])
				else 
					LReactorAndChest[3] = 0
				end
			else
				table.remove(glob.LReactorAndChest, k)
			end
		end
	end
end


function add_reactor_fuel()
	if glob.LReactorAndChest ~= nil then
		for k,LReactorAndChest in pairs(glob.LReactorAndChest) do
			if LReactorAndChest[1].valid and LReactorAndChest[2].valid then
				local fuelCount = LReactorAndChest[3]
				if fuelCount >=1 then
					LReactorAndChest[1].insert({name = "fission-reactor-fuel", count = fuelCount})
				end
			else
				table.remove(glob.LReactorAndChest, k)
			end
		end
	end
end

