extends Node2D

var main

func _ready():
    main = get_node("/root/Main")
    $Background/Header/Background.color = "00ffffff"
    $Background/Header/Background/TitleLabel.text = ""
    $Background/Header.update_screen()
        
func _on_NextButton_button_down():
    main.change_scene("report1")
