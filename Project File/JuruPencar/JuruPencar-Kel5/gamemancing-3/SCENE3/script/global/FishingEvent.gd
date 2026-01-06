extends Node
signal fish_obstacle_spawn_up
signal fish_obstacle_spawn_down
signal on_click_obstacle
signal off_click_obstacle

signal fish_successfully_catched(fish_type: String)
signal fish_failed_to_catched

var current_fish: String
