extends Node2D

func _physics_process(delta):
	$wheattext.text = ("= " + str(Global.numofwheats))
	$oniontext.text = ("= " + str(Global.numofonions))
