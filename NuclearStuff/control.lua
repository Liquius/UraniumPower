
require "defines"
 
game.onevent(defines.events.onbuiltentity, function(event)
	if event.createdentity.name == "nuclear-fission-reactor" then 
		reactor = (event.createdentity)
	end
end)




game.onevent(defines.events.ontick, function(event)
	if reactor == nil 
		then game.player.print("no reactor")
	elseif reactor.fluidbox == nil
		then game.player.print("no fuildbox")
	else
		fluids = reactor.fluidbox
	end
end)