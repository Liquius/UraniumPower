require "defines"


fuelAssemblyValue01 = 1
fuelAssemblyValue02 = 2
fuelAssemblyValue03 = 3
fuelAssemblyValue04 = 4
fuelAssemblyValue05 = 5
fuelAssemblyValue06 = 6
fuelAssemblyValue07 = 7
fuelAssemblyValue08 = 8
fuelAssemblyValue09 = 9
fuelAssemblyValue10 = 10



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

		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor3By3", caption = {"3 By 3"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor3By4", caption = {"3 By 4"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor3By5", caption = {"3 By 5"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor3By6", caption = {"3 By 6"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor4By3", caption = {"4 By 3"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor4By4", caption = {"4 By 4"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor4By5", caption = {"4 By 5"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor4By6", caption = {"4 By 6"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor5By3", caption = {"5 By 3"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor5By4", caption = {"5 By 4"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor5By5", caption = {"5 By 5"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor5By6", caption = {"5 By 6"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor6By3", caption = {"6 By 3"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor6By4", caption = {"6 By 4"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor6By5", caption = {"6 By 5"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor6By6", caption = {"6 By 6"}})

		nuclearFissionReactorKit = event.createdentity

	--for companion chest
	elseif event.createdentity.name == "fission-reactor-chest" then 
		if game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-3"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-3"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-4"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-4"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-5"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-5"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-6"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-6"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-4-by-3"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-4-by-3"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-4-by-4"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-4-by-4"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-4-by-5"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-4-by-5"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-4-by-6"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-4-by-6"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-5-by-3"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-5-by-3"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-5-by-4"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-5-by-4"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-5-by-5"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-5-by-5"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-5-by-6"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-5-by-6"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-6-by-3"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-6-by-3"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-6-by-4"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-6-by-4"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-6-by-5"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-6-by-5"})
		elseif game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-6-by-6"}) ~= nil then
			localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-6-by-6"})
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
	if event.clickgui == fissionReactor3By3 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-3-by-3", count = 1})
	elseif event.clickgui == fissionReactor3By4 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-3-by-4", count = 1})
	elseif event.clickgui == fissionReactor3By5 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-3-by-5", count = 1})
	elseif event.clickgui == fissionReactor3By6 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-3-by-6", count = 1})
	elseif event.clickgui == fissionReactor4By3 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-4-by-3", count = 1})
	elseif event.clickgui == fissionReactor4By4 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-4-by-4", count = 1})
	elseif event.clickgui == fissionReactor4By5 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-4-by-5", count = 1})
	elseif event.clickgui == fissionReactor4By6 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-4-by-6", count = 1})
	elseif event.clickgui == fissionReactor5By3 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-5-by-3", count = 1})
	elseif event.clickgui == fissionReactor5By4 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-5-by-4", count = 1})
	elseif event.clickgui == fissionReactor5By5 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-5-by-5", count = 1})
	elseif event.clickgui == fissionReactor5By6 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-5-by-6", count = 1})
	elseif event.clickgui == fissionReactor6By3 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-6-by-3", count = 1})
	elseif event.clickgui == fissionReactor6By4 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-6-by-4", count = 1})
	elseif event.clickgui == fissionReactor6By5 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-6-by-5", count = 1})
	elseif event.clickgui == fissionReactor6By6 then
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.insert({name = "fission-reactor-6-by-6", count = 1})
	end
end)


function calculate_fuel_amount()
	if glob.LReactorAndChest ~= nil then
		for k,LReactorAndChest in pairs(glob.LReactorAndChest) do
			if LReactorAndChest[1].valid and LReactorAndChest[2].valid then
				if LReactorAndChest[2].isempty == false then
					LReactorAndChest[3] = 0

					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue01 * (LReactorAndChest[2].getitemcount({name = "fuel-assembly-01"}))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue02 * (LReactorAndChest[2].getitemcount({name = "fuel-assembly-02"}))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue03 * (LReactorAndChest[2].getitemcount({name = "fuel-assembly-03"}))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue04 * (LReactorAndChest[2].getitemcount({name = "fuel-assembly-04"}))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue05 * (LReactorAndChest[2].getitemcount({name = "fuel-assembly-05"}))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue06 * (LReactorAndChest[2].getitemcount({name = "fuel-assembly-06"}))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue07 * (LReactorAndChest[2].getitemcount({name = "fuel-assembly-07"}))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue08 * (LReactorAndChest[2].getitemcount({name = "fuel-assembly-08"}))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue09 * (LReactorAndChest[2].getitemcount({name = "fuel-assembly-09"}))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssemblyValue10 * (LReactorAndChest[2].getitemcount({name = "fuel-assembly-10"}))

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