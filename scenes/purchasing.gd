extends Node2D

var main
var upgrade_item
var upgrade_cost
var upgrade_level

# Called when the node enters the scene tree for the first time.
func _ready():
    main = get_node("/root/Main")
    main.get_node("Header/TitleLabel").text = "Your Equipments"
    main.get_node("Header/DayLabel").visible = true
    main.get_node("Header/SubscriberLabel").visible = true
    main.get_node("Header/MoneyLabel").visible = true
    update_screen()
    main.money_previous = main.money
    main.subscribers_previous = main.subscribers
   
func update_screen():
    main.update_header()
    $Background/ComputerLv.text = str(main.computer_level)
    $Background/SoftwareLv.text = str(main.software_level)
    $Background/CameraLv.text = str(main.camera_level)
    $Background/MicrophoneLv.text = str(main.microphone_level)
    if main.computer_level >= 10:
        $Background/ComputerUpgradeButton.disabled = true
    if main.software_level >= 10:
        $Background/SoftwareUpgradeButton.disabled = true
    if main.camera_level >= 10:
        $Background/CameraUpgradeButton.disabled = true
    if main.microphone_level >= 10:
        $Background/MicrophoneUpgradeButton.disabled = true

func update_PurchaseDialog():
    if main.money >= upgrade_cost: 
      $Background/PurchaseDialog/ConfirmationMessage.text = "Would you like to upgrade your " + upgrade_item + " to level " + str(upgrade_level)  + "? \n" + "It will cost $" + str(upgrade_cost) + " to upgrade."
    else:
      $Background/PurchaseDialog/ConfirmationMessage.text = "You do not have enough money to upgrade your " + upgrade_item + "."
      $Background/PurchaseDialog/YesButton.disabled = true    
    $Background/PurchaseDialog.popup_centered()
    
func _on_ComputerUpgradeButton_button_down():
    main.play_effect("click")
    upgrade_item = "Computer"
    upgrade_cost = main.computer_level * 1000
    upgrade_level = main.computer_level + 1
    update_PurchaseDialog()
    
func _on_SoftwareUpgradeButton_button_down():
    main.play_effect("click")
    upgrade_item = "Editing Software"
    upgrade_cost = main.software_level * 500
    upgrade_level = main.software_level + 1
    update_PurchaseDialog()

func _on_CameraUpgradeButton_button_down():
    main.play_effect("click")
    upgrade_item = "Video Camera"
    upgrade_cost = main.camera_level * 100
    upgrade_level = main.camera_level + 1
    update_PurchaseDialog()

func _on_MicrophoneUpgrdeButton_button_down():
    main.play_effect("click")
    upgrade_item = "Microphone"
    upgrade_cost = main.microphone_level * 50
    upgrade_level = main.microphone_level + 1
    update_PurchaseDialog()

func _on_YesButton_button_down():
    main.play_effect("purchase")
    if upgrade_item == "Computer":
      main.computer_level = main.computer_level + 1
      main.money = main.money - upgrade_cost
    elif upgrade_item == "Editing Software":
      main.software_level = main.software_level + 1
      main.money = main.money - upgrade_cost
    elif upgrade_item == "Video Camera":
      main.camera_level = main.camera_level + 1
      main.money = main.money - upgrade_cost
    elif upgrade_item == "Microphone":
      main.microphone_level = main.microphone_level + 1
      main.money = main.money - upgrade_cost
    
    $Background/PurchaseDialog.visible = false
    update_screen()

func _on_NoButton_button_down():
    main.play_effect("click")
    $Background/PurchaseDialog.visible = false

func _on_NextButton_button_down():
    main.play_effect("click")
    main.change_scene("scheduling")
