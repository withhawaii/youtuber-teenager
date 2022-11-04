extends Node2D

var main

func _ready():
    main = get_node("/root/Main")
    main.get_node("Header/TitleLabel").text = "Select the Time"
    main.get_node("Header/DayLabel").visible = false
    main.get_node("Header/SubscriberLabel").visible = false
    main.get_node("Header/MoneyLabel").visible = false
    main.get_node("Header").visible = true

func _on_BackButton_button_down():
    main.play_effect("click")
    main.change_scene("title")

func _on_Option1_button_down():
    main.play_effect("click")
    main.total_days = 7
    main.change_scene("purchasing")

func _on_Option2_button_down():
    main.play_effect("click")
    main.total_days = 14
    main.change_scene("purchasing")

func _on_Option3_button_down():
    main.play_effect("click")
    main.total_days = 21
    main.change_scene("purchasing")
