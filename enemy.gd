extends RigidBody2D

@export var speed = 100
@export var health = 20
@export var target_player: Area2D
# Called when the node enters the scene tree for the first time.
func _ready():
	target_player = get_node("../Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (target_player != null):
		var player_direction = target_player.position - position
		var velocity = player_direction.normalized() * speed
		position += velocity * delta
	

