extends Node2D

var main
var total_time = 24 * 3 # Must be multiple of 24
var current_time = 0
var sleep_end_time
var eat_end_time
var school_end_time
var socialize_end_time
var youtube_end_time

func _ready():
    main = get_node("/root/Main")
    main.get_node("Header").color = "00ffffff"
    main.get_node("Header/TitleLabel").text = ""
    main.update_header()
    $Background/Chart.init_chart()
    sleep_end_time = total_time * main.sleep_hours / 24
    eat_end_time = total_time * main.eat_hours / 24 + sleep_end_time
    school_end_time = total_time * main.school_hours / 24 + eat_end_time
    socialize_end_time = total_time * main.socialize_hours / 24 + school_end_time
    youtube_end_time = total_time * main.youtube_hours / 24 + socialize_end_time
    main.play_music("main_theme")
    $Timer.start()
        
func _on_NextButton_button_down():
    main.stop_music()
    $Timer.stop()
    main.change_scene("report1")

func _on_Timer_timeout():
    current_time = current_time + 1
        
    if current_time >= 0 and current_time < sleep_end_time:
        $Background/Animation/TimerLabel.text = "Sleeping: " + str(sleep_end_time - current_time)
        change_animation("sleeping") 
        update_sleeping(sleep_end_time - current_time)
    elif current_time >= sleep_end_time and current_time < eat_end_time:
        $Background/Animation/TimerLabel.text = "Eating: " + str(eat_end_time - current_time) 
        change_animation("eating") 
        update_eating(eat_end_time - current_time)
    elif current_time >= eat_end_time and current_time < school_end_time:
        $Background/Animation/TimerLabel.text = "Studying: " + str(school_end_time - current_time) 
        change_animation("studying") 
        update_studying(school_end_time - current_time)
    elif current_time >= school_end_time and current_time < socialize_end_time:
        $Background/Animation/TimerLabel.text = "Hanging around: " + str(socialize_end_time - current_time) 
        change_animation("socializing") 
        update_socializing(socialize_end_time - current_time)
    elif current_time >= socialize_end_time and current_time < youtube_end_time:
        $Background/Animation/TimerLabel.text = "Yotubing: " + str(youtube_end_time - current_time) 
        change_animation("youtubing") 
        update_youtubing(youtube_end_time - current_time)
    elif current_time >= youtube_end_time:
        main.stop_music()
        $Timer.stop()
        main.change_scene("report1")
    $Background/Chart.update_screen()
    main.update_header()

func update_sleeping(elapsed_time):
    if elapsed_time <= 8 * 3:
        main.physical_points = main.physical_points + 3
        main.mental_points = main.mental_points + 3
    
func update_eating(elapsed_time):
    if elapsed_time <= 2 * 3:
        main.physical_points = main.physical_points + 3
    
func update_studying(elapsed_time):
    if main.physical_points > 0 and main.mental_points > 0:
        main.school_points = main.school_points + 3
        main.physical_points = main.physical_points - 1
        main.mental_points = main.mental_points - 1

func update_socializing(elapsed_time):
    if main.money > 0:
        main.social_points =  main.social_points + 3
        main.mental_points = main.mental_points + 1
        main.money = main.money - 10
    
func update_youtubing(elapsed_time):
    main.subscribers = main.subscribers + 3
    
func change_animation(activity):
    $Background/Animation/Eating.visible = false
    $Background/Animation/HangingOut.visible = false
    $Background/Animation/Sleeping.visible = false
    $Background/Animation/Studying.visible = false
    $Background/Animation/Youtubing.visible = false
    if activity == "eating":
        $Background/Animation/Eating.visible = true
    elif activity == "socializing":    
        $Background/Animation/HangingOut.visible = true                    
    elif activity == "sleeping":    
        $Background/Animation/Sleeping.visible = true
    elif activity == "studying":    
        $Background/Animation/Studying.visible = true
    elif activity == "youtubing":    
        $Background/Animation/Youtubing.visible = true
