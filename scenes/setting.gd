extends Node2D

var main

func _ready():
    main = get_node("/root/Main")

func _on_BackButton_button_down():
    main.change_scene("title")

func _on_Option1_button_down():
    main.total_days = 7
    main.change_scene("purchasing")

func _on_Option2_button_down():
    main.total_days = 14
    main.change_scene("purchasing")

func _on_Option3_button_down():
    main.total_days = 21
    main.change_scene("purchasing")
