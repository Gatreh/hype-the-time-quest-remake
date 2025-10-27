extends Node

func xor(a : bool, b : bool) -> bool:
	if a and b or not a and not b:
		return false
	else: return true

func xnor(a : bool, b : bool) -> bool:
	if a and b or not a and not b:
		return true
	else: return false
