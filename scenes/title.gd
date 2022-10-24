extends Node2D

var main

# Called when the node enters the scene tree for the first time.
func _ready():
    main = get_node("/root/Main")
    main.total_days = 0
    main.current_day = 1
    main.computer_level = 1
    main.softeware_level = 1
    main.camera_level = 1
    main.microphone_level = 1
    main.physical_points = 50
    main.mental_points = 50
    main.school_points = 50
    main.social_points = 50
    main.subscribers = 0
    main.money = 100
    main.happyness_points = 0

func _on_NextButton_button_down():
    main.change_scene("setting")
