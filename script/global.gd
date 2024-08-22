extends Node

signal to_level
signal next_level
signal to_map
signal to_entry


const COLLISION_LAYER_GHOST = 0
const COLLISION_LAYER_GROUND = 1
const COLLISION_LAYER_ENV = 1 << 1
const COLLISION_LAYER_BLOCK = 1 << 2
const COLLISION_LAYER_CRATE = 1 << 3
const COLLISION_LAYER_PLAYER = 1 << 4

const COLLISION_MASK_CRATE = COLLISION_LAYER_BLOCK + COLLISION_LAYER_CRATE + COLLISION_LAYER_PLAYER

const TILE_SIZE = 64

##关卡文件所在目录
const dir_path = "res://scene/level/"
##所有关卡文件路径
static var levels_path: Array[String] = []


static func _static_init() -> void:
	_init_levels()


static func _init_levels() -> void:
	var dir = DirAccess.open(dir_path)
	var files_string = dir.get_files()
	for f in files_string :
		levels_path.append(dir_path + f)
