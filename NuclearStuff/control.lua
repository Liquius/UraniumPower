
require "defines"
 
game.onevent(defines.events.onbuiltentity, function(event)
	if event.createdentity.name == "nuclear-fission-reactor" then
		if glob.LReactor == nil then
			glob.LReactor = {}
		end
		
		reactor = {true}
		
		reactor[1] = event.createdentity
		
		
		table.insert(glob.LReactor, reactor)
	end
end)



game.onevent(defines.events.ontick, function(event)
	if glob.LReactor ~= nil then
		for k,LReactor in pairs(glob.LReactor) do
			if LReactor[1].valid then
				if LReactor[1].fluidbox[2] ~= nil then
					fissionReactorOutput = {}
					fissionReactorOutput = LReactor[1].fluidbox[2]
					fissionReactorOutput["temperature"] = 100 
					LReactor[1].fluidbox[2] = fissionReactorOutput
				end
			else
				table.remove(glob.LReactor, k)
				game.player.print("Reactor removed")
			end
		end
	end
end)

