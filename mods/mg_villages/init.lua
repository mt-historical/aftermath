minetest.register_alias("mg:ignore", "ignore")

-- reserve namespace for the villages
mg_villages = {}

mg_villages.all_villages  = {}
mg_villages.mg_generated_map = {}
mg_villages.anz_villages = 0;

mg_villages.modpath = minetest.get_modpath( "mg_villages");


mg_villages.DEBUG_LEVEL_NONE    = -1 -- -1: disable all printed messages
mg_villages.DEBUG_LEVEL_NORMAL  =  0 -- 0: print information about which village spawned where plus important errors
mg_villages.DEBUG_LEVEL_WARNING =  1 -- 1: warnings/errors which may not be particulary helpful for non-developers
mg_villages.DEBUG_LEVEL_INFO    =  2 -- 2: print even less important warnings
mg_villages.DEBUG_LEVEL_TIMING  =  3 -- 3: detailled performance information

mg_villages.print = function( level, msg )
	if( level <= mg_villages.DEBUG_LEVEL ) then
		print( "[mg_villages] "..msg );
	end
end


-- save_restore is now part of handle_schematics
--dofile(mg_villages.modpath.."/save_restore.lua")
mg_villages.all_villages     = save_restore.restore_data( 'mg_all_villages.data' ); -- read mg_villages.all_villages data saved for this world from previous runs
mg_villages.mg_generated_map = save_restore.restore_data( 'mg_generated_map.data' );

dofile(mg_villages.modpath.."/config.lua")

-- adds a special gravel node which will neither fall nor be griefed by mapgen
dofile(mg_villages.modpath.."/nodes.lua")

-- the default game no longer provides helpful tree growing code
dofile(mg_villages.modpath.."/trees.lua")

dofile(mg_villages.modpath.."/replacements.lua")

-- multiple diffrent village types with their own sets of houses are supported
-- The function mg_villages.add_village_type( village_type_name, village_type_data )
--   allows other mods to add new village types.
dofile(mg_villages.modpath.."/village_types.lua")

-- Note: the "buildings" talbe is not in the mg_villages.* namespace
-- The function mg_villages.add_building( building_data ) allows other mods to add buildings.
dofile(mg_villages.modpath.."/buildings.lua")

-- mg_villages.init_weights() has to be called AFTER all village types and buildings have
-- been added using the functions above
dofile(mg_villages.modpath.."/init_weights.lua")

-- generate village names
dofile(mg_villages.modpath.."/name_gen.lua");

dofile(mg_villages.modpath.."/villages.lua")

-- adds a command that allows to teleport to a known village
dofile(mg_villages.modpath.."/chat_commands.lua")
-- protect villages from griefing
dofile(mg_villages.modpath.."/protection.lua")
-- create and show a map of the world
dofile(mg_villages.modpath.."/map_of_world.lua")

dofile(mg_villages.modpath.."/fill_chest.lua")

-- terrain blending for individual houses
dofile(mg_villages.modpath.."/terrain_blend.lua")
-- highlandpools
dofile(mg_villages.modpath.."/highlandpools.lua")
-- the interface for the mapgen;
-- also takes care of spawning the player
dofile(mg_villages.modpath.."/mapgen.lua")

dofile(mg_villages.modpath.."/spawn_player.lua")
