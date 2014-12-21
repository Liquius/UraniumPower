require "defines"


game.onevent(defines.events.onbuiltentity, function(event)
	if event.createdentity.name == "nuclear-fission-reactor" then 
		localFissionReactorMarkers = game.findentitiesfiltered({area = {{x = event.createdentity.position.x -10, y = event.createdentity.position.y -10}, {x = event.createdentity.position.x + 10, y = event.createdentity.position.y + 10}}, name = "fission-reactor-marker"})
		
		local xCoordinates = {}
		local yCoordinates = {}
		local x = 1
		local y = 1

		for i,v in ipairs(localFissionReactorMarkers) do
			x = localFissionReactorMarkers[i].position.x
				if x < math.huge then table.insert(xCoordinates, x)
			end
			y = localFissionReactorMarkers[i].position.y
				if y < math.huge then table.insert(yCoordinates, y)
			end
		end

		maxX = math.max(unpack(xCoordinates))
		maxY = math.max(unpack(yCoordinates))
		minX = math.min(unpack(xCoordinates))
		minY = math.min(unpack(yCoordinates))

		game.player.print(maxX)
		game.player.print(maxY)
		game.player.print(minX)
		game.player.print(minY)
		
	end
end)