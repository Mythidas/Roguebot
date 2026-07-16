extends Node

static var _players: Array[PlayerController]

func add_player(player: PlayerController) -> int:
	_players.append(player)
	return _players.size()

func get_player(id: int) -> PlayerController:
	if id < 0 || id > 4: return null
	return _players[id]
