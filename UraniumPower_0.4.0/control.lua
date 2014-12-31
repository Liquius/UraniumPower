require "defines"
require "util"



fuelAssemblyValue01 = 0.125
fuelAssemblyValue02 = 0.250
fuelAssemblyValue03 = 0.375
fuelAssemblyValue04 = 0.500
fuelAssemblyValue05 = 0.625
fuelAssemblyValue06 = 0.750
fuelAssemblyValue07 = 0.875
fuelAssemblyValue08 = 1.000
fuelAssemblyValue09 = 1.125
fuelAssemblyValue10 = 1.250



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
	--for creating the UI
	if event.createdentity.name == "nuclear-fission-reactor-kit" then 
		game.player.gui.center.add({type="flow", name="fissionReactorTable", direction="vertical"})

		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor3By3", caption = {"3 By 3"}})
--		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor3By4", caption = {"3 By 4"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor3By5", caption = {"3 By 5"}})
--		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor3By6", caption = {"3 By 6"}})
--		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor4By3", caption = {"4 By 3"}})
--		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor4By4", caption = {"4 By 4"}})
--		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor4By5", caption = {"4 By 5"}})
--		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor4By6", caption = {"4 By 6"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor5By3", caption = {"5 By 3"}})
--		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor5By4", caption = {"5 By 4"}})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor5By5", caption = {"5 By 5"}})
--		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor5By6", caption = {"5 By 6"}})
--		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor6By3", caption = {"6 By 3"}})
--		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor6By4", caption = {"6 By 4"}})
--		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor6By5", caption = {"6 By 5"}})
--		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor6By6", caption = {"6 By 6"}})

		nuclearFissionReactorKit = event.createdentity
--Make sure I get rid of duplecets
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-9" then
		results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-3-by-3"}
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
			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-12" then
		resultsA = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-3-by-4"}
		resultsB = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-4-by-3"}
		if #resultsA == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true, true}
			reactorAndChest[1] = results[1]
			reactorAndChest[2] = event.createdentity
			reactorAndChest[3] = 0
			table.insert(glob.LReactorAndChest, reactorAndChest)
			game.player.print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
		elseif #resultsB == 1 then
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
			game.player.insert({name = "nuclear-fission-reactor-chest-12", count = 1})
			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-15" then
		resultsA = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-3-by-5"}
		resultsB = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-5-by-3"}
		if resultsA ~= nil then 
			if #resultsA == 1 then
				if glob.LReactorAndChest == nil then
					glob.LReactorAndChest = {}
				end
				reactorAndChest = {true, true, true}
				reactorAndChest[1] = resultsA[1]
				reactorAndChest[2] = event.createdentity
				reactorAndChest[3] = 0
				table.insert(glob.LReactorAndChest, reactorAndChest)
				game.player.print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
				else
				event.createdentity.destroy()
				game.player.insert({name = "nuclear-fission-reactor-chest-15", count = 1})
				game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
			end
		elseif resultsB ~= nil then
			if #resultsB == 1 then
				if glob.LReactorAndChest == nil then
					glob.LReactorAndChest = {}
				end
				reactorAndChest = {true, true, true}
				reactorAndChest[1] = resultsB[1]
				reactorAndChest[2] = event.createdentity
				reactorAndChest[3] = 0
				table.insert(glob.LReactorAndChest, reactorAndChest)
				game.player.print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
				else
				event.createdentity.destroy()
				game.player.insert({name = "nuclear-fission-reactor-chest-15", count = 1})
				game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
			end
		else
			event.createdentity.destroy()
			game.player.insert({name = "nuclear-fission-reactor-chest-15", count = 1})
			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-18" then
		resultsA = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-3-by-6"}
		resultsB = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-6-by-3"}
		if #resultsA == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true, true}
			reactorAndChest[1] = results[1]
			reactorAndChest[2] = event.createdentity
			reactorAndChest[3] = 0
			table.insert(glob.LReactorAndChest, reactorAndChest)
			game.player.print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
		elseif #resultsB == 1 then
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
			game.player.insert({name = "nuclear-fission-reactor-chest-18", count = 1})
			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-16" then
		results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-4-by-4"}
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
			game.player.insert({name = "nuclear-fission-reactor-chest-16", count = 1})
			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-20" then
		resultsA = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-4-by-5"}
		resultsB = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-5-by-4"}
		if #resultsA == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true, true}
			reactorAndChest[1] = results[1]
			reactorAndChest[2] = event.createdentity
			reactorAndChest[3] = 0
			table.insert(glob.LReactorAndChest, reactorAndChest)
			game.player.print("Reactor access port successfully linked! Ready to accept fuel assemblies!")		
		elseif #resultsB == 1 then
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
			game.player.insert({name = "nuclear-fission-reactor-chest-20", count = 1})
			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-24" then
		resultsA = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-4-by-6"}
		resultsB = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-6-by-4"}
		if #resultsA == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true, true}
			reactorAndChest[1] = results[1]
			reactorAndChest[2] = event.createdentity
			reactorAndChest[3] = 0
			table.insert(glob.LReactorAndChest, reactorAndChest)
			game.player.print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
		elseif #resultsB == 1 then
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
			game.player.insert({name = "nuclear-fission-reactor-chest-24", count = 1})
			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-25" then
		results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-5-by-5"}
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
			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-30" then
		resultsA = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-5-by-6"}
		resultsB = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-6-by-5"}
		if #resultsA == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true, true}
			reactorAndChest[1] = results[1]
			reactorAndChest[2] = event.createdentity
			reactorAndChest[3] = 0
			table.insert(glob.LReactorAndChest, reactorAndChest)
			game.player.print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
		elseif #resultsB == 1 then
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
			game.player.insert({name = "nuclear-fission-reactor-chest-30", count = 1})
			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-36" then
		results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-6-by-6"}
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
			game.player.insert({name = "nuclear-fission-reactor-chest-36", count = 1})
			game.player.print("Reactor access port cannot find a fission reactor! Returning to your inventory. Make sure you place your reactor first, and that you place your reactor access port next to it.")
		end
	end
end)


game.onevent(defines.events.onguiclick, function(event)
	if event.element.name == "fissionReactor3By3" then
		game.player.insert({name = "nuclear-fission-reactor-chest-9", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-3-by-3", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor3By4" then
		game.player.insert({name = "nuclear-fission-reactor-chest-12", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-3-by-4", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor3By5" then
		game.player.insert({name = "nuclear-fission-reactor-chest-15", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-3-by-5", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor3By6" then
		game.player.insert({name = "nuclear-fission-reactor-chest-18", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-3-by-6", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor4By3" then
		game.player.insert({name = "nuclear-fission-reactor-chest-12", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-4-by-3", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor4By4" then
		game.player.insert({name = "nuclear-fission-reactor-chest-16", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-4-by-4", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor4By5" then
		game.player.insert({name = "nuclear-fission-reactor-chest-20", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-4-by-5", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor4By6" then
		game.player.insert({name = "nuclear-fission-reactor-chest-24", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-4-by-6", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor5By3" then
		game.player.insert({name = "nuclear-fission-reactor-chest-15", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-5-by-3", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor5By4" then
		game.player.insert({name = "nuclear-fission-reactor-chest-20", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-5-by-4", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor5By5" then
		game.player.insert({name = "nuclear-fission-reactor-chest-25", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-5-by-5", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor5By6" then
		game.player.insert({name = "nuclear-fission-reactor-chest-30", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-5-by-6", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor6By3" then
		game.player.insert({name = "nuclear-fission-reactor-chest-18", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-6-by-3", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor6By4" then
		game.player.insert({name = "nuclear-fission-reactor-chest-24", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-6-by-4", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor6By5" then
		game.player.insert({name = "nuclear-fission-reactor-chest-30", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-6-by-5", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()
	elseif event.element.name == "fissionReactor6By6" then
		game.player.insert({name = "nuclear-fission-reactor-chest-36", count = 1})
		game.player.insert({name = "nuclear-fission-reactor-6-by-6", count = 1})
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
		game.player.gui.center.fissionReactorTable.destroy()

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
				game.player.print("Fission reactor and access port no longer valid.")
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
				game.player.print("Fission reactor and access port no longer valid.")
			end
		end
	end
end

