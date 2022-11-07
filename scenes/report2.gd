extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready():
    main = get_node("/root/Main")
    main.get_node("Header/TitleLabel").text = "Life Balance Results"
    main.update_header()
    main.update_happiness_points()
    $Background/MessageLabel.text = "Your happiness points is "+ str(main.happiness_points) + "!"
    $Background/Chart.init_chart()
    if main.happiness_points >= 50:
        main.play_effect("thumbs_up")
    else:
        main.play_effect("thumbs_down")
        
func _on_NextButton_button_down():
    main.play_effect("click")
    if(main.is_game_over()):
      main.change_scene("gameover")
    else:
      main.current_day = main.current_day + 1
      main.change_scene("purchasing")

func _on_BackButton_button_down():
    main.play_effect("click")
    main.change_scene("report1")

func _on_Timer_timeout():
    $Background/FaceIcon.playing = false
    if main.happiness_points >= 75:
        $Background/FaceIcon.frame = 1
    elif main.happiness_points <= 50 and main.happiness_points < 75:
        $Background/FaceIcon.frame = 2
    elif main.happiness_points <= 25 and main.happiness_points < 50:
        $Background/FaceIcon.frame = 3
    elif main.happiness_points < 25:
        $Background/FaceIcon.frame = 4
