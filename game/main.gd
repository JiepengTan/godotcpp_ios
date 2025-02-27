extends Node

func _ready() -> void:
	var s = Summator.new()
	s.add(10)
	s.add(20)
	s.add(303)
	var val = s.get_total()
	$Text.text = str(val)
	print()
	s.reset()

