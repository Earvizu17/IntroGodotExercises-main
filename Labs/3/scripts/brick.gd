extends StaticBody2D

signal destroyed


func destroy():
	emit_signal("destroyed")
	queue_free()
