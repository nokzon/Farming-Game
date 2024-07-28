extends StaticBody2D

var plant = Global.plantselected
var plantgrowing = false
var plant_grown = false

func _physics_process(delta):
	if plantgrowing == false:
		plant = Global.plantselected
		
func _on_area_2d_area_entered(area):
	if not plantgrowing:
		if plant == 1:	#wheat
			plantgrowing = true
			$wheatgrowtimer.start()
			$plant.play("wheatgrowing")
		if plant == 2:	#onion
			plantgrowing = true
			$oniongrowtimer.start()
			$plant.play("oniongrowing")
	else:
		print("plant is already growing here")

func _on_wheatgrowtimer_timeout():
	var wheat_plant = $plant
	if wheat_plant.frame == 0:
		wheat_plant.frame = 1
		$wheatgrowtimer.start()
	elif wheat_plant.frame == 1:
		wheat_plant.frame = 2
	elif wheat_plant.frame == 2:
		wheat_plant.frame = 3
		plant_grown = true


func _on_oniongrowtimer_timeout():
	var onion_plant = $plant
	if onion_plant.frame == 0:
		onion_plant.frame = 1
		$oniongrowtimer.start()
	elif onion_plant.frame == 1:
		onion_plant.frame = 2
	elif onion_plant.frame == 2:
		onion_plant.frame = 3
		plant_grown = true

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if plant_grown:
			if plant == 1:
				Global.numofwheats += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			if plant == 2:
				Global.numofonions += 1
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			else:
				pass
