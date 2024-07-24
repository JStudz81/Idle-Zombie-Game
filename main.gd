extends Node

@export var zombie_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$ZombieTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_zombie_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = zombie_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $ZombiePath/ZombieSpawn
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position
	

	# TODO: Aim zombies at center
	# Add some randomness to the direction.
	direction = mob.position.angle_to_point(Vector2(1152/2, 648/2))
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
