
require "defines"
 
game.onevent(defines.events.onbuiltentity, function(event)
	if event.createdentity.name == "nuclear-fission-reactor" then 
		reactor = (event.createdentity)
	end
end)

fissionReactorOutput = {}

game.onevent(defines.events.ontick, function(event)
	if reactor == nil 
		then game.player.print("no reactor")
	elseif reactor.fluidbox[2] == nil 
		then game.player.print("nil value from fluidbox")
	else
		fissionReactorOutput = reactor.fluidbox[2]
		fissionReactorOutput["temperature"] = 100 
		reactor.fluidbox[2] = fissionReactorOutput
		game.player.print("should work")
	end
end)

