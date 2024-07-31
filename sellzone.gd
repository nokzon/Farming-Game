extends StaticBody2D

func _on_area_2d_body_entered(body):
	if body.has_method("player_sell_method"):
		var wheats = Global.numofwheats
		var onions = Global.numofonions
		var coins = Global.coins
		
		#wheats = 3 coins #onions = 5 coins
		
		coins += wheats * 30
		coins += onions * 20

		wheats = 0
		onions = 0
		
		Global.coins = coins
		Global.numofwheats = wheats
		Global.numofonions = onions
