extends Node2D

# System variables
var total_days
var current_day

# Player variables
var computer_level
var softeware_level
var camera_level
var microphone_level
var physical_points
var mental_points
var school_points
var social_points
var subscribers
var money
var happyness_points

# Called when the node enters the scene tree for the first time.
func _ready():
    change_scene("title")

func change_scene(name):
    var current_scene = get_child(0)
    remove_child(current_scene)
    var new_scene = load("res://scenes/" + name + ".tscn").instance()
    add_child(new_scene)

func get_current_day_number():
    return "Day: " + str(current_day)

func is_no_more_days_left():
    return current_day >= total_days

func update_physical_points(study_hours, socialize_hours, sleep_hours, eat_hours, youtube_hours):
    pass

func update_mental_points(study_hours, socialize_hours, sleep_hours, eat_hours, youtube_hours):
    pass

func update_school_points(study_hours, socialize_hours, sleep_hours, eat_hours, youtube_hours):
    pass

func update_social_points(study_hours, socialize_hours, sleep_hours, eat_hours, youtube_hours):
    pass
