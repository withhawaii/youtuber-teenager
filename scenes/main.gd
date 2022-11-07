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
var subscribers_previous
var money
var money_previous
var money_total
var happiness_points
var happiness_points_total

# Current hours allocation
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
    subscribers_previous = subscribers
    money = 100
    money_previous = money
    money_total = 0
    happiness_points = 0
    happiness_points_total = 0
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
   
func is_game_over():
    return current_day >= total_days or physical_points <= 0 or mental_points <= 0 or school_points <= 0 or social_points <= 0

func update_youtuber_points():
    youtuber_points = computer_level * 160 + software_level * 80 + camera_level * 40 + microphone_level * 20 + subscribers
    print("youtuber points:" + str(youtuber_points))

func update_happiness_points():
    var average = (float(physical_points) + float(mental_points) + float(school_points) + float(social_points)) / 4.0
#    print("average:" + str(average))
    var stdiv =  sqrt((pow(float(physical_points) - average, 2) + pow(float(mental_points) - average, 2) + pow(float(school_points) - average, 2) + pow(float(social_points) - average, 2)) / 4.0)
#    print("stdiv:" + str(stdiv))
    happiness_points = int(average - stdiv)
    happiness_points_total = happiness_points_total + happiness_points

func update_money():
    money_previous = money
    money = money + int(randi() % 10 * subscribers * 0.001)
    money_total = money_total + (money - money_previous)

func get_thumbs_up():
    if randi() % 10 >= 8:
      return randi() % youtuber_points
    else:
      return 0  
