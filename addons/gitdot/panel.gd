@tool
extends VBoxContainer

var initailize_output = []
var clone_output = []
var add_output = []
var push_output = []
var commit_output = []
var status_output = []
var pull_output = []
var self_repo_pull_output = []
var edited_file_output = []
var diff_output = []
var unstage_output = []
var pro_path = ""



func _ready():
	# $Output.add_color_region("@", "", Color(255,0,0), true)
	# $Output.add_color_region("+", "", Color(0,255,0), true)
	# $Output.add_color_region("-", "", Color(0,0,255), true)
	pass



func _on_Initailize_pressed():
	pro_path = ProjectSettings.globalize_path("res://")
	var cd_path = "cd " + pro_path #+ " && git init"
	var git_in = "git init"
	OS.execute("CMD.exe", ["/C",cd_path], initailize_output , true)
	OS.execute("CMD.exe", ["/C",git_in], initailize_output ,true)
	for out in initailize_output:
		if out:
			$Output.text += out + "\n"
		else:
			$Output.text +="@Error \n"
			$Output.text += "@Either git is not installed or you are not connected To The Internet \n"



func _on_Clone_Btn_pressed():
	pro_path = ProjectSettings.globalize_path("res://")
	var link = $"Clone Container/Link".text
	var cd_cmd = "cd " + pro_path
	var remote_add = "git remote add origin " + link
	var fetch = "git fetch"
	var checkout = "git checkout -t origin/master"
	if link:
		OS.execute("CMD.exe" , ["/C", cd_cmd], clone_output, true)
		OS.execute("CMD.exe" , ["/C", remote_add] , clone_output, true)
		OS.execute("CMD.exe" , ["/C", fetch] , clone_output,  true)
		OS.execute("CMD.exe" , ["/C", checkout] , clone_output, true)
	for out in clone_output:
		if out:
			$Output.text += out + "\n"
		else:
			$Output.text +="@Error \n"
			$Output.text += "@Folder not recognized as Local Repo. \n"




func _on_Add_Button_pressed():
	pro_path = ProjectSettings.globalize_path("res://")
	var files = $"Add Container/Files".text
	var cd_cmd = "cd " + pro_path + " && git add " + files
	var add_cmd = "git add " + files
	if files:
		OS.execute("CMD.exe" , ["/C" , cd_cmd], add_output , true)
		OS.execute("CMD.exe" , ["/C" , add_cmd], add_output, true)
	for out in add_output:
		if out:
			$Output.text += out + "\n"
		else:
			$Output.text +="@Error \n"
			$Output.text += "@Did'nt clone The repo. \n"



func _on_Push_Btn_pressed():
	pro_path = ProjectSettings.globalize_path("res://")
	var command = "cd " + pro_path + " && git push"
	OS.execute("CMD.exe" , ["/C", command], push_output , true)
	for out in push_output:
		if out:
			$Output.text += out + "\n"
		else:
			$Output.text +="@Error \n"
			$Output.text += "@ Did'nt commit any file. \n"




func _on_Commit_Button_pressed():
	var cd_cmd = "cd " + pro_path
	var commit_msg = $"Commit Container/LineEdit".text
	var commit_cmd = "git commit -m " + commit_msg
	OS.execute("CMD.exe", ["/C", commit_cmd], commit_output, true)
	for out in commit_output:
		if out:
			$Output.text += out + "\n"
		else:
			$Output.text +="@Error \n"
			$Output.text += "@Did'nt staged any file. \n"



func _on_Get_Status_pressed():
	var status_cmd = "git status"
	OS.execute("CMD.exe", ["/C", status_cmd], status_output, true)
	for out in status_output:
		if out:
			$Output.text += out + "\n"
		else:
			$Output.text +="@Error \n"
			$Output.text += "@Either git is not installed or you are not connected To The Internet \n"



#func _on_Pull_Button_pressed():
#	var link = $"Pull/Pull Link".text
#	var cd_cmd = "cd " + pro_path
#	var pull_cmd = "git pull " + link
#	if link:
#		OS.execute("CMD.exe", ["/C", cd_cmd], true, pull_output)
#		OS.execute("CMD.exe", ["/C", pull_cmd], true, pull_output)
#	for out in pull_output:
#		if out:
#			print(out)
#		else:
#			print("Error")
#			print("Either git is not installed or you are not connected To The Internet")


func _on_Pull_Self_Repo_pressed():
	var pull = "git pull"
	var cd = "cd " + pro_path
	OS.execute("CMD.exe", ["/C", cd], self_repo_pull_output, true)
	OS.execute("CMD.exe", ["/C", pull], self_repo_pull_output, true)
	for out in self_repo_pull_output:
		if out:
			$Output.text += out + "\n"
		else:
			$Output.text +="@Error \n"
			$Output.text += "@Either broken link or you are not connected To The Internet \n"



func _on_Clear_Btn_pressed():
	$Output.text = "Outputs : \n"


func _on_Edited_File_pressed():
	var cd = "cd " + pro_path
	var get_files = "git diff --name-only --staged"
	OS.execute("CMD.exe", ["/C", cd], edited_file_output, true)
	OS.execute("CMD.exe", ["/C", get_files], edited_file_output, true)
	for out in edited_file_output:
		if out:
			$Output.text += out + "\n"
		else:
			$Output.text +="@Error \n"
			$Output.text += "@Did'nt staged any file. \n"


func _on_Diff_Btn_pressed():
	var cd = "cd " + pro_path
	var diff = "git diff --cached"
	OS.execute("CMD.exe", ["/C", cd], diff_output, true)
	OS.execute("CMD.exe", ["/C", diff], diff_output, true)
	for out in diff_output:
		if out:
			$Output.text += out + "\n"
		else:
			$Output.text +="@Error \n"
			$Output.text += "@Did'nt staged any file. \n"


func _on_Unstage_Btn_pressed():
	var cd = " cd " + pro_path
	var unstage = "git reset"
	OS.execute("CMD.exe", ["/C", cd], unstage_output, true)
	OS.execute("CMD.exe", ["/C", unstage], unstage_output, true)
	for out in unstage_output:
		if out:
			$Output.text += out + "\n"
		else:
			$Output.text +="@Error \n"

