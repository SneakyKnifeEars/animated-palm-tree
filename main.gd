extends Node

@export var enemy_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_spawn_timer_timeout():
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2.ZERO
