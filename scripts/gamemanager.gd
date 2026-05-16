extends Node

var plants_eaten: int = 0
var isInDialogue: bool = false
var isOnCharacter: bool = false

var isInBattle: bool = false

func leaveDialogue():
	isInDialogue = false
	isOnCharacter = false

func leaveBattle():
	isInBattle = false
