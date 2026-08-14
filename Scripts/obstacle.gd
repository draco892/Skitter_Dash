extends Area2D

var speed = 250 # Obstacle velocity

func _process(delta):
	# Move the obstacle to the left at every fram
	position.x -= speed * delta
	
	# Eliminate the obstacle if it goes off the screen so as not to burden the game
	if position.x < -100:
		queue_free()

# connect this signal from the Inspector (Signals Tab) when the Player touches the area
func _on_body_entered(body):
	if body.name == "Player":
		print("GAME OVER!")
		get_tree().reload_current_scene() # Restart the game when the player is hit
