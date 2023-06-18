extends Area2D

@export var speed = 400
@export var bullet_speed = 500
@export var projectile: PackedScene
var bullet_loaded = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#MOVEMENT CODE
	#set velocity to 0 start of frame
	var velocity = Vector2.ZERO
	#get input
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	#if player is moving, animate
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	if velocity:
		rotation = velocity.angle()
		
	#SHOOTING CODE
	if bullet_loaded:
		if Input.is_action_pressed("attack"):
			var bullet = projectile.instantiate()
			var direction = rotation
			bullet.linear_velocity = Vector2(bullet_speed,0.0).rotated(direction)
			bullet.position = position
			add_sibling(bullet)
			bullet_loaded = false
			$Reload.start()


func _on_reload_timeout():
	bullet_loaded = true
