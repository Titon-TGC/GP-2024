extends CharacterBody2D

@export var bullet_scene:PackedScene
@export var bullet_spawn:Node2D
var Mouse_Position

const SPEED = 10000.0

var can_fire = true;

const TURN_RATE = 180

func print_stuff():
	DebugDraw2D.set_text("pos", position)
	DebugDraw2D.set_text("rotation", rad_to_deg(rotation))
	DebugDraw2D.set_text("transform.x", transform.x)
	DebugDraw2D.set_text("transform.y", transform.y)
	DebugDraw2D.set_text("global_transform.x", global_transform.x)
	DebugDraw2D.set_text("global_transform.y", global_transform.y)
	DebugDraw2D.set_text("vel", velocity)

func _ready():
	# bullet = load("res://bullet.tscn")
	# bullet_spawn = get_node("shoot_point")
	
	pass

func _physics_process(delta):
	
	var f = Input.get_axis("move_backwards", "move_forwards")
	
	#var r = Input.get_axis("turn_left", "turn_right")
	
	var vel = transform.x * f * SPEED * delta
	#var vel2 = transform.y * r * SPEED
	velocity = vel
	
	move_and_slide()
	
	if Input.is_action_just_pressed("fire") and can_fire:
		var b = bullet_scene.instantiate()
		b.global_position = bullet_spawn.global_position
		b.global_rotation = bullet_spawn.global_rotation
		get_tree().get_root().add_child(b) 
		can_fire = false
		$Timer.start()
	
	pass
	
func _process(delta):
	print_stuff()
	Mouse_Position = get_local_mouse_position()
	rotation += Mouse_Position.angle()
	
	pass

func _on_timer_timeout():
	can_fire = true
	pass # Replace with function body.
