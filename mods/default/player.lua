if minetest.get_modpath("player_api") then
	default.registered_player_models = player_api.registered_models
	default.player_register_model    = player_api.register_model
	default.player_attached          = player_api.player_attached
	default.player_get_animation     = player_api.get_animation
	default.player_set_model         = player_api.set_model
	default.player_set_textures      = player_api.set_textures
	default.player_set_animation     = player_api.set_animation
end

-- Update appearance when the player joins
minetest.register_on_joinplayer(function(player)
	player:hud_set_hotbar_image("gui_hotbar.png")
	player:hud_set_hotbar_selected_image("gui_hotbar_selected.png")
end)