require "defines"
require "util"


fuelAssemblyValue01 = 0.0238
fuelAssemblyValue02 = 0.0476
fuelAssemblyValue03 = 0.0714
fuelAssemblyValue04 = 0.0952
fuelAssemblyValue05 = 0.1190
fuelAssemblyValue06 = 0.1429
fuelAssemblyValue07 = 0.1667
fuelAssemblyValue08 = 0.1905
fuelAssemblyValue09 = 0.2143
fuelAssemblyValue10 = 0.2381



-- Remember to fix multplayer



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
		tickingB = 9
		add_reactor_fuel()
	else
		tickingB = tickingB - 1
	end

	if glob.LHeatExchanger ~= nil then
		do_heat_exchange()
	end
end)


game.onevent(defines.events.onbuiltentity, function(event)
	local x1 = event.createdentity.position.x-1
	local y1 = event.createdentity.position.y-1
	local x2 = x1+2
	local y2 = y1+2

-- Fission reactor stuff

	if event.createdentity.name == "nuclear-fission-reactor-3-by-3" then
		event.createdentity.operable = false
		for i,player in ipairs(game.players) do
			game.players[i].insert({name = "nuclear-fission-reactor-chest-9", count = 1})
			game.players[i].print("Place the reactor access port next to the fission reactor.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-5-by-5" then
		event.createdentity.operable = false
		for i,player in ipairs(game.players) do
			game.players[i].insert({name = "nuclear-fission-reactor-chest-25", count = 1})
			game.players[i].print("Place the reactor access port next to the fission reactor.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-9" then
		results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-3-by-3"}
		if #results == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true, true, true}
			reactorAndChest[1] = results[1]
			reactorAndChest[2] = event.createdentity
			reactorAndChest[3] = 0
			reactorAndChest[4] = 0
			table.insert(glob.LReactorAndChest, reactorAndChest)
			for i,player in ipairs(game.players) do
				game.players[i].print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
			end
		else
			for i,player in ipairs(game.players) do
				game.players[i].insert({name = "nuclear-fission-reactor-chest-9", count = 1})
				game.players[i].print("Reactor access port cannot find a fission reactor! Returning to your inventory.")
			end
			event.createdentity.destroy()
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-25" then
		results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-5-by-5"}
		if #results == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true, true, true}
			reactorAndChest[1] = results[1]
			reactorAndChest[2] = event.createdentity
			reactorAndChest[3] = 0
			reactorAndChest[4] = 0
			table.insert(glob.LReactorAndChest, reactorAndChest)
			for i,player in ipairs(game.players) do
				game.players[i].print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
			end
		else
			for i,player in ipairs(game.players) do
				game.players[i].insert({name = "nuclear-fission-reactor-chest-25", count = 1})
				game.players[i].print("Reactor access port cannot find a fission reactor! Returning to your inventory.")
			end
			event.createdentity.destroy()
		end

-- Heat exchanger stuff

	elseif event.createdentity.name == "heat-exchanger" then
		if glob.LHeatExchanger == nil then
			glob.LHeatExchanger = {}
		end

		local x = event.createdentity.position.x
		local y = event.createdentity.position.y

		local up = game.findentitiesfiltered{area = {{x, y+1}, {x, y+1}}, name = "pipe"}
		local down = game.findentitiesfiltered{area = {{x, y-1}, {x, y-1}}, name = "pipe"}
		local left = game.findentitiesfiltered{area = {{x-1, y}, {x-1, y}}, name = "pipe"}
		local right = game.findentitiesfiltered{area = {{x+1, y}, {x+1, y}}, name = "pipe"}
 
		heatExchanger = {}	
		heatExchanger[1] = event.createdentity

		if up[1] ~= nil and down[1] ~= nil then
			--game.player.print("up and down working")

			heatExchanger[2] = up[1]
			heatExchanger[3] = down[1]
			table.insert(glob.LHeatExchanger, heatExchanger)
		elseif left[1] ~= nil and right[1] ~= nil then
			--game.player.print("left and right working")

			heatExchanger[2] = left[1]
			heatExchanger[3] = right[1]
			table.insert(glob.LHeatExchanger, heatExchanger)
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
				local fuelCount = LReactorAndChest[3] + LReactorAndChest[4]
				fuelCountInt = math.floor(fuelCount)
				LReactorAndChest[4] = fuelCount - fuelCountInt
				if fuelCount >=1 then
					LReactorAndChest[1].insert({name = "fission-reactor-fuel", count = fuelCountInt})
				end
			else
				table.remove(glob.LReactorAndChest, k)
			end
		end
	end
end


function do_heat_exchange()
	for k,LHeatExchanger in pairs(glob.LHeatExchanger) do
		if LHeatExchanger[1].valid and LHeatExchanger[2].valid and LHeatExchanger[3].valid then
			if LHeatExchanger[2].fluidbox[1] and LHeatExchanger[3].fluidbox[1] ~= nil then

				local v1 = LHeatExchanger[2].fluidbox[1].amount
				local t1 = LHeatExchanger[2].fluidbox[1].temperature
				local v2 = LHeatExchanger[3].fluidbox[1].amount
				local t2 = LHeatExchanger[3].fluidbox[1].temperature
				local newFluidBox1 = LHeatExchanger[2].fluidbox[1]
				local newFluidBox2 = LHeatExchanger[3].fluidbox[1]
				local maxT1 = 100
				local minT1 = 25
				local heatCapacity1 = 1
				local maxT2 = 100
				local minT2 = 25
				local heatCapacity2 = 1

				if LHeatExchanger[2].fluidbox[1].type == "pressurised-water" then
					maxT1 = 300
					minT1 = 15
					heatCapacity1 = 1.5
				elseif LHeatExchanger[2].fluidbox[1].type == "water" then
					maxT1 = 100
					minT1 = 15
					heatCapacity1 = 1
				end

				if LHeatExchanger[3].fluidbox[1].type == "pressurised-water" then
					maxT2 = 300
					minT2 = 15
					heatCapacity2 = 1.5
				elseif LHeatExchanger[3].fluidbox[1].type == "water" then
					maxT2 = 100
					minT2 = 15
					heatCapacity2 = 1
				end

				energy1 = v1*t1*heatCapacity1
				energy2 = v2*t2*heatCapacity2
				totalEnergy = energy1+energy2

				newTemp = totalEnergy/(v1*heatCapacity1+v2*heatCapacity2)
				--game.player.print(newTemp)


				if newTemp > minT1 and newTemp < maxT1 and newTemp > minT2 and newTemp < maxT1 then
					newTemp1 = newTemp
					newTemp2 = newTemp
				end
					
				if newTemp > maxT1 then
					newTemp1 = maxT1
					newTemp2 = (totalEnergy-(v1*maxT1*heatCapacity1))/(v2*heatCapacity2)
				end

				if newTemp > maxT2 then
					newTemp2 = maxT2
					newTemp1 = (totalEnergy-(v2*maxT2*heatCapacity2))/(v1*heatCapacity1)
				end

				--game.player.print("newTemp1 == "..newTemp1.."newTemp2 == "..newTemp2)

				newFluidBox1["temperature"] = newTemp1
				newFluidBox2["temperature"] = newTemp2

				LHeatExchanger[2].fluidbox[1] = newFluidBox1
				LHeatExchanger[3].fluidbox[1] = newFluidBox2	
			end
		else
			table.remove(glob.LHeatExchanger, k)
		end
	end
end
