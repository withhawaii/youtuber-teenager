extends Node2D

var main

func _ready():
    main = get_node("/root/Main")
    
func init_chart():
  $Background/PhysicalPointsBar.value = main.physical_points
  $Background/MentalPointsBar.value = main.mental_points  
  $Background/SchoolPointsBar.value = main.school_points  
  $Background/SocialPointsBar.value = main.social_points  

func update_screen():
  $Tween.interpolate_property($Background/PhysicalPointsBar, "value", $Background/PhysicalPointsBar.value, main.physical_points, 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
  $Tween.start()
  $Tween.interpolate_property($Background/MentalPointsBar, "value", $Background/MentalPointsBar.value , main.mental_points, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
  $Tween.start()
  $Tween.interpolate_property($Background/SchoolPointsBar, "value", $Background/SchoolPointsBar.value, main.school_points, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
  $Tween.start()
  $Tween.interpolate_property($Background/SocialPointsBar, "value", $Background/SocialPointsBar.value, main.social_points, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT_IN)
  $Tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
