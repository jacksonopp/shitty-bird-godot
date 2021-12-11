extends Area2D


func _on_WorldLeft_area_exited(area: Area2D) -> void:
	area.queue_free()
