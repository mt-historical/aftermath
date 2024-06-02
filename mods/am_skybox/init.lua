minetest.register_on_joinplayer(function(player)
    player:override_day_night_ratio(0.5)
	player:set_sky("#1f2226", "skybox", {
		"DarkStormyUp.jpg",
		"DarkStormyDown.jpg",
		"DarkStormyFront.jpg",
		"DarkStormyBack.jpg",
		"DarkStormyLeft.jpg",
        "DarkStormyRight.jpg",
	})
end)