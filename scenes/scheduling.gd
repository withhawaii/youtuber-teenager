extends Node2D

var main
var total_hours

# Called when the node enters the scene tree for the first time.
func _ready():
    main = get_node("/root/Main")
    main.school_hours = 0
    main.socialize_hours = 0
    main.eat_hours = 0
    main.sleep_hours = 0
    main.youtube_hours = 0
    update_screen()
    
func _on_NextButton_button_down():
    main.play_effect("click")
    $Background/ConfirmationDialog.visible = true

func _on_BackButton_button_down():
    main.play_effect("click")
    main.change_scene("purchasing")

func update_screen():
    main.get_node("Header/TitleLabel").text = "Set Your Schedule"
    main.update_header()
    total_hours = main.school_hours + main.socialize_hours + main.eat_hours + main.sleep_hours + main.youtube_hours
    if total_hours == 24:
        $Background/RemainingHoursLabel.text = "You are good to go!"
        $Background/NextButton.disabled = false    
    elif total_hours < 24:    
        $Background/RemainingHoursLabel.text = "You still have " + str(24 - total_hours) + " hours left."
        $Background/NextButton.disabled = true
    else:
        $Background/RemainingHoursLabel.text = "You allocated more than 24 hours!!!"
        $Background/NextButton.disabled = true

func _on_SchoolHoursSlider_drag_ended(value_changed):
    main.play_effect("click")
    main.school_hours = $Background/SchoolHoursSlider.value
    update_screen()

func _on_SocializeHoursSlider_drag_ended(value_changed):
    main.play_effect("click")
    main.socialize_hours = $Background/SocializeHoursSlider.value
    update_screen()

func _on_EatHoursSlider_drag_ended(value_changed):
    main.play_effect("click")
    main.eat_hours = $Background/EatHoursSlider.value
    update_screen()

func _on_SleepHoursSlider_drag_ended(value_changed):
    main.play_effect("click")
    main.sleep_hours = $Background/SleepHoursSlider.value
    update_screen()

func _on_YoutubeHoursSlider_drag_ended(value_changed):
    main.play_effect("click")
    main.youtube_hours = $Background/YoutubeHoursSlider.value
    update_screen()

func _on_YesButton_button_down():    
    main.play_effect("click")
    $Background/ConfirmationDialog.visible = false
    main.change_scene("simulation")

func _on_NoButton_button_down():
    main.play_effect("click")
    $Background/ConfirmationDialog.visible = false
