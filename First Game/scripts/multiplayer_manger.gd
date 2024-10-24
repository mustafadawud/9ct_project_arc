extends Node

const SERVER_PORT = 8080
const SERVER_IP = "127.0.0.1"

var multiplayer_scene = preload("res://scenes/Multiplayer_Player.tscn")

var _player_spawn_node

func become_host():
	print("starting host!")
	
	_player_spawn_node = get_tree().get_current_scene().get_node("Players")
	
	
	var  server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(SERVER_PORT)
	
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(_add_player_to_game)
	multiplayer.peer_disconnected.connect(_add_player_to_game)
func join_as_player_2():
	print("player 2 joining")

func _add_player_to_game(id: int):
	print("Player %s joined the game!" % id)
	
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_cilentS(SERVER_IP, SERVER_PORT)
	
	multiplayer.multiplayer_peer = client_peer
	
	var player_to_add = multiplayer_scene.instantiate()
	player_to_add.player_id = id
	player_to_add.name = str(id)
	
	_player_spawn_node.add_child(player_to_add, true)
	
func _del_player(id: int):
	print("Player %s left the game!" % id)
