-- Initialize the settings on world load
script.on_init(
	function ()
		sync_long_reach_settings()
	end
)

-- When mod settings are changed, go ahead and reload ours, just in case
-- Could optimize by checking if it's our setting, but it's probably not worth it
script.on_event({defines.events.on_runtime_mod_setting_changed},
	function (player_index, setting) 
		sync_long_reach_settings()
	end
)

function sync_long_reach_settings()
		local settings = settings.global
		
		-- Default build and reach distances are 6, so subtract that from the requested distance
		game.forces["player"].character_build_distance_bonus = settings["long-reach-build-distance"]["value"] - 6
		game.forces["player"].character_reach_distance_bonus = settings["long-reach-reach-distance"]["value"] - 6
end