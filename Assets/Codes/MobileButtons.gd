extends CanvasLayer

onready var holder = $Holder


func _ready():
	holder.visible = GlobalSettings.mobile
	
	if PlayerStats.LEG_LEVEL >= 2:
		$Holder/S.show()
	else:
		$Holder/S.hide()
	
	if PlayerStats.LEG_LEVEL >= 5:
		$Holder/V.show()
	else:
		$Holder/V.hide()


func _process(_delta):
	holder.visible = GlobalSettings.mobile
	
	if PlayerStats.LEG_LEVEL >= 2:
		$Holder/S.show()
	else:
		$Holder/S.hide()
	
	if PlayerStats.LEG_LEVEL >= 5:
		$Holder/V.show()
	else:
		$Holder/V.hide()

