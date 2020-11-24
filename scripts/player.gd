extends KinematicBody2D

export (int) var speed = 200
export (float) var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir = 0

func get_input():
    rotation_dir = 0
    velocity = Vector2()
    if Input.is_key_pressed(KEY_RIGHT):
        rotation_dir += 1
    if Input.is_key_pressed(KEY_LEFT):
        rotation_dir -= 1
    if Input.is_key_pressed(KEY_DOWN):
        velocity = Vector2(-speed, 0).rotated(rotation)
    if Input.is_key_pressed(KEY_UP):
        velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
    get_input()
    rotation += rotation_dir * rotation_speed * delta
    move_and_slide(velocity)