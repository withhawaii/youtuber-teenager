extends Node2D

var main

func _ready():
    main = get_node("/root/Main")
    update_screen()
   
func update_screen():
    $Background/DayLabel.text = "Day: " + str(main.current_day) + " of " + str(main.total_days)
    $Background/MoneyLabel.text = "Money: $" + str(main.money)
    $Background/SubscriberLabel.text = "Subscribers: " + str(main.subscribers)
