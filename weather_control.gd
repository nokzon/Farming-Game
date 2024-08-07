extends StaticBody2D

var current_weather = "none" # none, rain

# Called when the node enters the scene tree for the first time.
func _ready():
	if current_weather == "none":
		self.visible = false
	if current_weather == "rain":
		self.visible = true

func _on_timer_timeout():
	if current_weather == "none":
		current_weather = "rain"
		$Timer.wait_time = randi_range(10,30)	# range for how long the rain will last
		$Timer.start()
	elif current_weather == "rain":
		current_weather = "none"
		$Timer.wait_time = randi_range(20,60)
		$Timer.start()

func _process(delta):
	Global.weather = current_weather
	if current_weather == "none":
		self.visible = false
	if current_weather == "rain":
		self.visible = true
