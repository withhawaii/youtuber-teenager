extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready():
    main = get_node("/root/Main")
    $Background/DayLabel.text = main.get_current_day_number()
   
func _on_NextButton_button_down():
    main.change_scene("scheduling")
