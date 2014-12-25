require "defines"


fuelAssemblyValuei = 1 --script this


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
	--for creating the UI
	if event.createdentity.name == "nuclear-fission-reactor-kit" then 
		game.player.gui.center.add({type="flow", name="fissionReactorTable", direction="horizontal"})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor3By3", caption = {"3 By 3"}}) --script this
		nuclearFissionReactorKit = event.createdentity

	--for companion chest
	elseif event.createdentity.name == "fission-reactor-chest" then 
		if game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-3"}) ~= nil then --needs more script
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-3"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-4"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-4"})
		local count = 0
		for i in pairs(localFissionReactor) do
			count = count +1 
		end
		if count == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true, true}

			reactorAndChest[1] = localFissionReactor[1]
			reactorAndChest[2] = event.createdentity

			table.insert(glob.LReactorAndChest, reactorAndChest)

			game.player.print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
		else
			event.createdentity.destroy()
			game.player.insert({name = "fission-reactor-chest", count = 1})
			game.player.print("Reactor access port can't find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
		end
	end
end)


game.onevent(defines.events.onguiclick, function(event)
	--script here
	if event.clickgui == fissionReactor3By3 then
		game.player.insert({name = "fission-reactor-3-by-3", count = 1})
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
	end
end)


function calculate_fuel_amount()
	if glob.LReactorAndChest ~= nil then
		for k,LReactorAndChest in pairs(glob.LReactorAndChest) do
			if LReactorAndChest[1].valid and LReactorAndChest[2].valid then
				if LReactorAndChest[2].isempty == false then
					LReactorAndChest[3] = 0

					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValuei * (LReactorAndChest[2].getitemcount({name = "fuel-assembly-i"}))
					--script here
				end
			else
				table.remove(glob.LReactorAndChest, k)
				game.player.print("Fission reactor and access port no longer valid.")
			end
		end
	end
end


function add_reactor_fuel()
	if glob.LReactorAndChest ~= nil then
		for k,LReactorAndChest in pairs(glob.LReactorAndChest) do
			if LReactorAndChest[1].valid and LReactorAndChest[2].valid then
				LReactorAndChest[1].insert({name = "coal", count = 1})
			else
				table.remove(glob.LReactorAndChest, k)
				game.player.print("Fission reactor and access port no longer valid.")
			end
		end
	end
end