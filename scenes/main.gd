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
var youtuber_points
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
    var current_scene = $Body.get_child(0)
    remove_child(current_scene)
    var new_scene = load("res://scenes/" + name + ".tscn").instance()
    $Body.add_child(new_scene)
    
func is_no_more_days_left():
    return current_day >= total_days

func update_header():
    $Header/DayLabel.text = "Day: " + str(current_day) + " of " + str(total_days)
    $Header/MoneyLabel.text = str(money)
    $Header/SubscriberLabel.text = str(subscribers)

func play_effect(name):
    $EffectPlayer.stream = load("res://assets/sounds/" + name +".wav")
    return $EffectPlayer.play()

func play_music(name):
    $MusicPlayer.stream = load("res://assets/sounds/" + name +".wav")
    return $MusicPlayer.play()
    
func stop_music():
    $MusicPlayer.stop()
       
