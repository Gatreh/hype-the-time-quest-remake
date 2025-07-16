extends Node

func xor(a : bool, b : bool) -> bool:
	if a and b:
		return true
	elif not a and not b:
		return true
	else: return false

func xnor(a : bool, b : bool) -> bool:
	if a and b:
		return false
	elif not a and not b:
		return false
	else:
		return true
