extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready():
    main = get_node("/root/Main")
    main.init_variables()

func _on_NextButton_button_down():
    main.change_scene("setting")


func _on_HowToPlayButton_button_down():
    $Background/HowToPlayDialog.popup_centered()


func _on_YesButton_button_down():
    $Background/HowToPlayDialog.visible = false
