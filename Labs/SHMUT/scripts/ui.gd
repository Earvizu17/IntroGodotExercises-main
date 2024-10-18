extends CanvasLayer

const SCORE_TEXT = "Score: "


func set_score(score: int) -> void:
	$Label.text = SCORE_TEXT + str(score)
