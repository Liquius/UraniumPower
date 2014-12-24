require "defines"


game.onevent(defines.events.onbuiltentity, function(event)
	--for creating the UI
	if event.createdentity.name == "nuclear-fission-reactor-kit" then 
		game.player.gui.center.add({type="flow", name="fissionReactorTable", direction="horizontal"})
		game.player.gui.center.fissionReactorTable.add({type="button", name="fissionReactor3By3", caption = {"3 By 3"}})
		nuclearFissionReactorKit = event.createdentity

	--for companion chest
	elseif event.createdentity.name == "fission-reactor-chest" then 
		localFissionReactor = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-3-by-3"})
		local count = 0
		for i in pairs(localFissionReactor) do
			count = count +1 
		end
		if count == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true}

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
		game.player.insert({name = "fission-reactor-3-by-3", count = 1})
		game.player.insert({name = "fission-reactor-chest", count = 1})
		game.player.gui.center.fissionReactorTable.destroy()
		nuclearFissionReactorKit.destroy()
		game.player.print("Place the fission reactor first, and then place the reactor access port next to your reactor.")
	end
end)


game.onevent(defines.events.ontick, function(event)
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
end)