extends Node2D

# System variables
var total_days
var current_day

# Player variables
var computer_level
var software_level
var camera_level
var microphone_level
var physical_points
var mental_points
var school_points
var social_points
var subscribers
var previous_subscribers
var money
var previous_money
var happiness_points

# Current hour allocations
var school_hours
var socialize_hours
var eat_hours
var sleep_hours
var youtube_hours

# Called when the node enters the scene tree for the first time.
func _ready():
    change_scene("title")

func init_variables():
    total_days = 0
    current_day = 1
    computer_level = 1
    software_level = 1
    camera_level = 1
    microphone_level = 1
    physical_points = 50
    mental_points = 50
    school_points = 50
    social_points = 50
    subscribers = 0
    previous_subscribers = subscribers
    money = 100000
    previous_money = money
    happiness_points = 0
    school_hours = 0
    socialize_hours = 0
    eat_hours = 0
    sleep_hours = 0
    youtube_hours = 0

func change_scene(name):
    var current_scene = get_child(0)
    remove_child(current_scene)
    var new_scene = load("res://scenes/" + name + ".tscn").instance()
    add_child(new_scene)

func is_no_more_days_left():
    return current_day >= total_days

func update_physical_points(study_hours, socialize_hours, sleep_hours, eat_hours, youtube_hours):
    # A sample implementation

    # If there is no sleep, take out 20 points. 
    if sleep_hours == 0:
        physical_points = physical_points - 20
    # If sleep hours are between 1 and 8, points will be recovered based on hours.
    elif sleep_hours > 0 and sleep_hours <= 8:
        physical_points = physical_points + sleep_hours * 10
    # If sleep hours are more than 8, 80 points will be recovered as 8 sleep hours are max.
    else:
        physical_points = physical_points + 8 * 10

    # If eat hours are more than 1, 20 points will be recovered.
    if eat_hours > 0:
        physical_points = physical_points + 20

func update_mental_points(study_hours, socialize_hours, sleep_hours, eat_hours, youtube_hours):
    pass

func update_school_points(study_hours, socialize_hours, sleep_hours, eat_hours, youtube_hours):
    pass

func update_social_points(study_hours, socialize_hours, sleep_hours, eat_hours, youtube_hours):
    pass
