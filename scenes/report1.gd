extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready():
    main = get_node("/root/Main")
    main.get_node("Header/TitleLabel").text = "Youtuber Results"
    main.get_node("Header").color = "ff0000"
    main.update_header()
    if main.subscribers >= main.subscribers_previous:
        $Background/MessageLabel.text = "Congraturations!\n You have " + str(main.subscribers - main.subscribers_previous) + " new subscribers and earned $"+ str(main.money - main.money_previous) + "!\n"
        $Background/MessageLabel.text = $Background/MessageLabel.text + "It's " + str(1000000 - main.subscribers) + " more to reach Youtube silver creator award."
        main.play_effect("thumbs_up")
    else:
        $Background/MessageLabel.text = "Hang in there!\n You lost " + str(main.previous_subscribers - main.subscribers) + " subscribers!"
        main.play_effect("thumbs_down")
                
func _on_NextButton_button_down():
    main.play_effect("click")
    main.change_scene("report2")

