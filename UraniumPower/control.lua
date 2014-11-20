
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
					fissionReactorOutput["temperature"] = 275 
					LReactor[1].fluidbox[2] = fissionReactorOutput
				end
			else
				table.remove(glob.LReactor, k)
				game.player.print("Reactor removed")
			end
		end
	end
end)

game.onload(function()
	local debug = true
	if debug == true then
  game.player.insert{name="nuclear-fission-reactor", count=5}
  game.player.insert{name="roboport", count=10}
  game.player.insert{name="steam-engine", count=100}
  game.player.insert{name="logistic-robot", count=200}
  game.player.insert{name="medium-electric-pole", count=50}
  game.player.insert{name="logistic-chest-requester", count=50}
  game.player.insert{name="logistic-chest-passive-provider", count=50}
  game.player.insert{name="fuel-assembly-iiiiiiiii", count=20}
  game.player.insert{name="fuel-assembly-iiii", count=20}
end
end)