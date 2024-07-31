extends StaticBody2D

#item 1 = carrot #item 2 = starfruit
var item = 1

var item1price = 100
var item2price = 250

var item1owned = false
var item2owned = false

var price 

func _ready():
	$icon.play("carrotseed")
	item = 1
	
func _physics_process(delta):
	if self.visible == true:
		if item == 1:
			$icon.play("carrotseed")
			$pricelabel.text = "1 0 0"
			if Global.coins >= item1price:
				if item1owned == false:
					$buybutton.disabled = false
				else:
					$buybutton.disabled = true
			else:
				$buybutton.disabled = true
				
		if item == 2:
			$icon.play("starfruitseed")
			$pricelabel.text = "2 5 0"
			if Global.coins >= item2price:
				if item2owned == false:
					$buybutton.disabled = false
				else:
					$buybutton.disabled = true
			else:
				$buybutton.disabled = true

func _on_leftbutton_pressed():
	swap_item_back()
func _on_rightbutton_pressed():
	swap_item_forward()
func _on_buybutton_pressed():
	print("buy")
	if item == 1:
		price = item1price
		if Global.coins >= price:
			if item1owned == false:
				buy()
	elif item == 2:
		price = item2price
		if Global.coins >= price:
			if item2owned == false:
				buy()
	
func swap_item_back():
	if item == 1:
		item = 2
	elif item == 2:
		item = 1
		
func swap_item_forward():
	if item == 1:
		item = 2
	elif item == 2:
		item = 1
		
func buy():
	Global.coins -= price
	if item == 1:
		item1owned = true
	if item == 2:
		item2owned = true
