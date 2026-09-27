extends Node2D


func _ready() -> void:
	
	#for i in range(1, 32):
		#$CanvasLayer/day.add_item(str(i))
	
	
	pass # Replace with function body.


func _process(delta: float) -> void:
	if $CanvasLayer/him.text != "":
		$CanvasLayer/him_label.text = $CanvasLayer/him.text
	else:
		$CanvasLayer/him_label.text = "Ammar?"
		

var code = ""
func _on_copy_pressed() -> void:
	#print(DisplayServer.clipboard_get())
	DisplayServer.clipboard_set(code)
	print("copied ", code)

var him = ""

var codes = [
	{"letter"="a", "cipher" = ""},
]

func _on_generate_pressed() -> void:
	code = "" 
	him = $CanvasLayer/him.text
	for i in him:
		#print(i.unicode_at(0))
		print(char(i.unicode_at(0)+1))
		code += (char(i.unicode_at(0)+1))
		var temp = randi_range(60,130)
		code += (char(temp))
		
	$CanvasLayer/code.text = code
	print(code)
	decipher()

var deciphered = ""
func decipher():
	deciphered = ""
	for i in code.length():
		if !i % 2: 
			deciphered += char(code[i].unicode_at(0)-1)
	
	
	$CanvasLayer/og.text = deciphered
