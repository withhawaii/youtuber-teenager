extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready():
    main = get_node("/root/Main")
    main.get_node("Header/TitleLabel").text = "Youtuber Results"
    main.get_node("Header").color = "ff0000"
    main.update_header()
    if main.subscribers >= main.previous_subscribers:
        $Background/MessageLabel.text = "Congraturations!\n You have " + str(main.subscribers - main.previous_subscribers) + " new subscribers!\n"
        $Background/MessageLabel.text = $Background/MessageLabel.text + "It's " + str(1000000 - main.subscribers) + " more to reach siliver creator award."
    else:
        $Background/MessageLabel.text = "Hang in there!\n You lost " + str(main.previous_subscribers - main.subscribers) + " subscribers!"
    main.play_effect("notice")
                
func _on_NextButton_button_down():
    main.play_effect("click")
    main.change_scene("report2")

