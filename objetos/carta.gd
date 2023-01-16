extends Node2D

enum{PRACIMA,PRABAIXO}
var mouseOver = false

signal exibirDetalhes
export (int) var estado = PRABAIXO
export (Texture) var frente = load("res://_assets/cartas/militar/2.png")

onready var anima = $anima
onready var face = $frente
onready var timeDetalhes = $detalhes

func _ready():
	face.texture = frente
	match estado:
		PRACIMA:
			anima.play("revela")
		PRABAIXO:
			anima.play("RESET") 
			
			

func _physics_process(delta):
	if mouseOver and Input.is_mouse_button_pressed(1):
		estado = PRACIMA
		anima.play("revela")


func _on_pick_mouse_entered():
	print("passou no ",self.name)
	mouseOver = true
	timeDetalhes.start(2)

func _on_pick_mouse_exited():
	mouseOver = false
	timeDetalhes.stop()


func _on_detalhes_timeout():
	emit_signal("exibirDetalhes",frente)
