require "defines"


game.onevent(defines.events.onbuiltentity, function(event)
	if event.createdentity.name == "nuclear-fission-reactor-kit" then 
		game.player.gui.center.add({ type="button", name="fissionReactor3By3", caption = {"3 By 3"}})
		nuclearFissionReactorKit = event.createdentity
	end
end)


game.onevent(defines.events.onguiclick, function(event)
	if event.clickgui == fissionReactor3By3 then
		--game.player.insert({name = fissionReactor3By3, count = 1})
		game.player.insert({name = "coal", count = 1})
		gui.destroy()
		game.player.destroy(nuclearFissionReactorKit)
	end
end)