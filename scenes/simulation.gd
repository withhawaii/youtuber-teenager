extends Node2D

var main

func _ready():
    main = get_node("/root/Main")
    $Background/DayLabel.text = main.get_current_day_number()
    
func _on_NextButton_button_down():
    main.change_scene("report1")
