extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	
	var animations = $AnimatedSprite2D.sprite_frames.get_animation_names() # obtener nombres de las animaciones 
	#animacion, animacion , animacion
	$AnimatedSprite2D.play(animations[randi() % animations.size()]) #llama animaciones del 0 al 2
												#tamaño de la  animacion

	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free() # funcion  eleminar el enemigo 
