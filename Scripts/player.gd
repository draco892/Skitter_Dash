extends CharacterBody2D

const SPEED = 300.0 # World scrolling speed relative to the player
const JUMP_VELOCITY = -400.0 # Jump strength (negative because the Y axis goes downwards)

# Get gravity from project settings for consistency
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var collision = $CollisionShape2D
@onready var sprite = $Sprite2D

func _physics_process(delta):
	# 1. Apply gravity if not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta

	# 2. Jump management
	if Input.is_action_just_pressed("salt") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# 3. Ducking management
	if Input.is_action_pressed("abbassati") and is_on_floor():
		# Shrink the collision to allow passing under high obstacles
		collision.scale.y = 0.5
		sprite.scale.y = 0.5 # Optional: also shrinks the sprite image
	else:
		collision.scale.y = 1.0
		sprite.scale.y = 1.0

	# Apply movement (in this game the player is fixed, the world moves)
	move_and_slide()
