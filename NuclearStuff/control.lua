
require "defines"
 
game.onevent(defines.events.onbuiltentity, function(event)
	if event.createdentity.name == "nuclear-fission-reactor" then 
		reactor(event.createdentity)
	end
end)




game.onevent(defines.events.ontick, function(event)
	if reactor.equals nil then 
		game.player.print("nopes")
	elseif reactor.valid then
		game.player.print("trues")
	end
end)