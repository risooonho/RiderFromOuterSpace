extends KinematicBody2D

const UP = Vector2(0,-1)
const SPEED = 100
const GRAVITY = 20

var maxHp = 50
var hp = 50

var motion = Vector2(SPEED, 0)

func _process(delta):
	motion.y += GRAVITY
	
	print_hp()
	
	
	if !hp:
		dies()
	
	if $left.is_colliding() or !$leftDown.is_colliding():
		motion.x = SPEED
	elif $right.is_colliding() or !$rightDown.is_colliding():
		motion.x = -SPEED
	
	if motion.x > 0:
		$Sprite.flip_h = false
		$Sprite.play("Walk")
	elif motion.x < 0:
		$Sprite.flip_h = true
		$Sprite.play("Walk")
	else:
		$Sprite.play("Idle")
	
	motion = move_and_slide(motion, UP)
	
	
	# testa as colisões
	test_collision()
	
	pass

func print_hp():
	$HP.set_value(hp)

func dies():
	queue_free()

func does_damage(damage):
	hp -= damage
	hp = max(0, hp)
	pass

func test_collision():
	var i
	for i in get_slide_count():
		var body = get_slide_collision(i)
		#if body.get_name() == "PlayerTest":
		#	body.receive_damage()
		pass
	
	pass