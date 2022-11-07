extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready():
    main = get_node("/root/Main")
    main.get_node("Header/TitleLabel").text = "Game Over"
    main.update_header()
    $Background/SubscribersNumLabel.text = str(main.subscribers)
    $Background/MoneyNumLabel.text = "$" + str(main.money_total)
    $Background/HappinessNumLabel.text = str(main.happiness_points_total)
    main.play_effect("notice")
    
func _on_NextButton_button_down():
    main.play_effect("click")
    main.change_scene("title")
