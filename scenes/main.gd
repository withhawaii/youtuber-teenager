extends Node2D

# Declare member variables here.
var total_days = 0
var day = 1

# Called when the node enters the scene tree for the first time.
func _ready():
    change_scene("title")

func change_scene(name):
    var current_scene = get_child(0)
    remove_child(current_scene)
    var new_scene = load("res://scenes/" + name + ".tscn").instance()
    add_child(new_scene)

func get_current_day_number():
    return "Day: " + str(day)

func is_no_more_days_left():
    return day >= total_days
