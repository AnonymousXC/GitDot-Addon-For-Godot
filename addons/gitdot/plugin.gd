@tool
extends EditorPlugin


const MainPanel = preload("res://addons/gitdot/scenes/panel.tscn")

var main_panel_instance


func _enter_tree():
	main_panel_instance = MainPanel.instantiate()
	add_control_to_bottom_panel(main_panel_instance, "Gitdot")
	make_visible(false)


func _exit_tree():
	if main_panel_instance:
		main_panel_instance.queue_free()


func has_main_screen():
	return true


func make_visible(visible):
	if main_panel_instance:
		main_panel_instance.visible = visible


func get_plugin_name():
	return "GitDot"


func get_plugin_icon():
	return get_editor_interface().get_base_control().get_icon("Node2D", "EditorIcons")
