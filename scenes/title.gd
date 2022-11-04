extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready():
    main = get_node("/root/Main")
    main.get_node("Header").visible = false
    main.init_variables()

func _on_NextButton_button_down():
    main.play_effect("click")
    main.change_scene("setting")


func _on_HowToPlayButton_button_down():
    main.play_effect("click")
    $Background/HowToPlayDialog.popup_centered()

func _on_YesButton_button_down():
    main.play_effect("click")
    $Background/HowToPlayDialog.visible = false

