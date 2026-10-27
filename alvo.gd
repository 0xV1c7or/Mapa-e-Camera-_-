extends Area2D


@onready var texto_label: Label = $Label 

func _on_body_entered(body: Node2D) -> void:
	if body.name.to_lower() == "player":
		texto_label.visible = true
