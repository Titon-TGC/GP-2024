extends CharacterBody2D
@export var speed = 100
var player_position
var target_position
@onready var player = $CharacterBody2D

func _ready():
	scale = Vector2.ZERO
	var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "scale", Vector2.ONE, 0.5)


func _on_input_event(viewport, event, shape_idx):
	pass

func _physics_process(delta):
	
	player_position = player.position
	target_position = (player_position - position).normalized()
	
	if position.distance_to(player_position) > 3:
		move_and_collide(target_position * speed * delta)
		look_at(player_position)
	pass
