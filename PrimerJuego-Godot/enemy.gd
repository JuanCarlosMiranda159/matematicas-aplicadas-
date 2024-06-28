extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var animations = $AnimatedSprite2D.sprite_frames.get_animation_names() # obtener nombres de las animaciones 
	pass # Replace with function body.
	$AnimatedSprite2D.play(animations[randi() % animations.size()])
												#tamaño de la  animacion
	print(animations)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # funcion  eleminar el enemigo 
