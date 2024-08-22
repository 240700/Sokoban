class_name Player
extends CharacterBody2D

const SPEED = 200
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _physics_process(_delta: float) -> void:
	
	if move_and_slide():
		var collision = get_last_slide_collision()
		var collider = collision.get_collider()
		if collider is Crate:
			if collision.get_normal().dot(velocity.normalized()) == -1:
				collider.move(velocity.normalized())


func move(direction: Vector2):
	velocity = direction * SPEED
	
	if direction.x > 0:
		animation_player.play("right")
	elif direction.x < 0:
		animation_player.play("left")
	elif direction.y > 0:
		animation_player.play("down")
	elif direction.y <0:
		animation_player.play("up")
	else:
		animation_player.stop()
