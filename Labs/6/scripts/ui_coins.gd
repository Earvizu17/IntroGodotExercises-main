extends HBoxContainer

var max_score: int = 1 : set = _set_max_score
var score: int = 0 : set = _set_score

# Used as a template for automatically instantiated coins
@onready var coin_node = $Coin.duplicate()
var _coins: Array[Control]


func _ready() -> void:
	_create_coins(max_score)


func _set_max_score(new_max_score: int):
	max_score = new_max_score
	_create_coins(max_score)
	_set_score(score)


func _create_coins(count: int) -> void:
	_coins.clear()
	for coin in get_children():
		coin.queue_free()
	for i in range(count):
		var coin = coin_node.duplicate()
		_coins.append(coin)
		add_child(coin)


func _set_score(new_score: int):
	score = clampi(new_score, 0, max_score)
	for coin_index in range(new_score):
		_coins[coin_index].modulate = Color.WHITE
