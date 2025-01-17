extends Node

const SEEDS_MAX : int = 1
const DIRT_BLOCKS_MAX : int = 3

var inventory : Dictionary = {
	"seed" : [0, SEEDS_MAX],
	"dirt_block" : [0, DIRT_BLOCKS_MAX]
}

func _ready():
	var starting_seeds = get_parent().get_parent().get_node("Settings").start_seeds
	add("seed", starting_seeds)

func add(item_name, ct) -> bool:
	if inventory[item_name][0] < inventory[item_name][1]:
		inventory[item_name][0] += ct
		if inventory[item_name][0] > inventory[item_name][1]:
			inventory[item_name][0] = inventory[item_name][1]
		return true
	return false	

func remove(item_name) -> bool:
	if inventory[item_name][0] > 0:
		inventory[item_name][0] -= 1
		return true
	return false	

func full(item_name) -> bool:
	return inventory[item_name][0] >= inventory[item_name][1]

func empty(item_name) -> bool:
	return inventory[item_name][0] <= 0

func count(item_name) -> int:
	return inventory[item_name][0]
