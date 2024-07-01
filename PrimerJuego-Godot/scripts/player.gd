extends Area2D
signal hit
@export var speed = 250
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size #medida resolucion 
	print(screen_size)
	hide()
#se ejetucta solo 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x += -1
	if Input.is_action_pressed("up"):
		velocity.y += -1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed #para evitar movimiento 
		$AnimatedSprite2D.play()
		show()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)# clamp limitar  pantalla
			# animacion segun su posicion
	process_animations(velocity.x , velocity.y)
	
func process_animations(velocity_x , velocity_y):
	if velocity_x != 0:
		$AnimatedSprite2D.animation = "walk"
		#$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_v= false # la ultima accion se quedara asi abajo ,voltear 
		$AnimatedSprite2D.flip_h = velocity_x < 0 # asignacion buleana 
		#if velocity_x < 0:
		#$AnimatedSprite2D.flip_h =flip_h 
		 #trabaja con buelanos 
	elif velocity_y !=0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity_y  > 0


func _on_body_entered(body):
	hide() #esconder
	hit.emit()
	$CollisionShape2D.set_deferred("disabled",true)#immortal 
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false	
	
