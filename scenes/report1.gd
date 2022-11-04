extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready():
    main = get_node("/root/Main")
    $Background/Header/Background/TitleLabel.text = "Youtuber Results"
    $Background/Header.update_screen()
    if main.subscribers >= main.previous_subscribers:
        $Background/MessageLabel.text = "Congraturations!\n You have " + str(main.subscribers - main.previous_subscribers) + " new subscribers!\n"
        $Background/MessageLabel.text = $Background/MessageLabel.text + "It's " + str(1000000 - main.subscribers) + " more to reach siliver creator award."
    else:
        $Background/MessageLabel.text = "Hang in there!\n You lost " + str(main.previous_subscribers - main.subscribers) + " subscribers!"
            
    
func _on_NextButton_button_down():
    main.play_click()
    main.change_scene("report2")

