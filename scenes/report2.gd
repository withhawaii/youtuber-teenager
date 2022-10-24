extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready():
    main = get_node("/root/Main")
    $Background/DayLabel.text = main.get_current_day_number()
    
func _on_NextButton_button_down():
    if(main.is_no_more_days_left()):
      main.change_scene("gameover")
    else:
      main.current_day = main.current_day + 1
      main.change_scene("purchasing")

func _on_BackButton_button_down():
    main.change_scene("report1")
