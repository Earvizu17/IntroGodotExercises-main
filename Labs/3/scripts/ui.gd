extends CanvasLayer

const SCORE_TEXT = "Score: "


func set_score(score):
	$Score.text = SCORE_TEXT + str(score)
