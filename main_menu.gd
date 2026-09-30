extends Node2D


func _ready() -> void:
	
	#for i in range(1, 32):
		#$CanvasLayer/form/birdthday/day.add_item(str(i))
	
	#print(str(9).unicode_at(0))
	# 48 - 57
	pass # Replace with function body.
#
#func _process(delta: float) -> void:
	#if $CanvasLayer/form/him.text != "":
		#$CanvasLayer/form/him_label.text = $CanvasLayer/form/him.text
	#else:
		#$CanvasLayer/form/him_label.text = "Ammar?"
	#
	
	
	

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
	him = $CanvasLayer/form/him.text
	#print()
	var day = ($CanvasLayer/form/birdthday/day.text)
	var month = ($CanvasLayer/form/birdthday/month.text)
	var year = ($CanvasLayer/form/birdthday/year.text)
	
	# 722008
	# 12122008
	
	for i in $CanvasLayer/form/rooms.get_children():
		if i.button_pressed:
			code += i.text
	
	for i in day:
		code += (char(i.unicode_at(0)+30))
	code += (char(50))
	for i in month:
		code += (char(i.unicode_at(0)+40))
	code += (char(54))
	for i in year:
		code += (char(i.unicode_at(0)+50))
	code += (char(48))
	
	
	
	for i in him:
		#print(i.unicode_at(0))
		print(char(i.unicode_at(0)+1))
		code += (char(i.unicode_at(0)+1))
		var temp = randi_range(60,130)
		code += (char(temp))
		
	$CanvasLayer/form/code.text = code
	print(code)
	decipher()

var deciphered = ""
func decipher():
	deciphered = ""
	for i in code.length():
		if !i % 2: 
			deciphered += char(code[i].unicode_at(0)-1)
	
	
	#$CanvasLayer/form/og.text = deciphered

var was_day = ""
var was_month = ""
var was_year = ""


func _on_day_text_changed(new_text: String) -> void:
	print("new_text", new_text)
	var last_letter = "" 
	var temp = ""
	if new_text: 
		last_letter = new_text[new_text.length()-1]
		temp = int(char(last_letter.unicode_at(0)))
		print(last_letter)
		print(temp)
	#else: $CanvasLayer/form/birdthday/day.text = "1"
	if new_text: 
		if was_day != "" && new_text.length() == 1:
			pass
		elif temp < 0 || temp > 9 || (
			(temp == 0) && was_day == "") ||(
			was_day == "3" && (temp != 1 && temp != 0))||(
			was_day != "" && was_day != "1" && was_day != "2" && was_day != "3"
			):
			
			
			new_text = was_day
			$CanvasLayer/form/birdthday/day.text = was_day
			print("wrong")
			if new_text:
				$CanvasLayer/form/birdthday/day.caret_column = new_text.length()
			
			
	was_day = new_text


func _on_month_text_changed(new_text: String) -> void:
	print("new_text", new_text)
	var last_letter = "" 
	var temp = ""
	if new_text: 
		last_letter = new_text[new_text.length()-1]
		temp = int(char(last_letter.unicode_at(0)))
		print(last_letter)
		print(temp)
	if new_text: 
		if was_month != "" && new_text.length() == 1:
			pass
		elif temp < 0 || temp > 9 || (
			(temp == 0) && was_month == "") ||(
			was_month == "1" && (temp != 2 && temp != 1 && temp != 0))||(
			was_month != "" && was_month != "1" && was_month != "2" )||(
				int(char(new_text[0].unicode_at(0))) > 1 && new_text.length() != 1
			):
			
			new_text = was_month
			$CanvasLayer/form/birdthday/month.text = was_month
			print("wrong")
			if new_text:
				$CanvasLayer/form/birdthday/month.caret_column = new_text.length()
			
	was_month = new_text


func _on_year_text_changed(new_text: String) -> void:
	print("new_text", new_text)
	var last_letter = "" 
	var temp = ""
	var wrong = 0
	if new_text: 
		last_letter = new_text[new_text.length()-1]
		temp = int(char(last_letter.unicode_at(0)))
		print(last_letter)
		print(temp)
	if new_text: 
		if was_year != "" && new_text.length() == 1:
			pass
		elif temp < 0 || temp > 9 :
			print("temp < 0 || temp > 9 :")
			wrong = 1
		elif (temp == 0) && was_year == "" :
			print("(temp == 0) && was_year == :")
			wrong = 1
		elif was_year == "1" && (temp != 9) && new_text.length() == 2:
			print("was_year ==  && (temp != 9) && new_text.length() == 2:")
			wrong = 1
		#elif was_year != "" && was_year != "1" && was_year != "2" :
			#print("was_year != & was_year !=  && was_year !=  :")
			#wrong = 1
		elif int(char(new_text[0].unicode_at(0))) > 2:
			print("int(char(new_text[0].unicode_at(0))) > 2:")
			wrong = 1
		elif was_year == "2" && (temp != 0) && new_text.length() == 2:
			wrong = 1
		elif was_year == "202" && (temp > 6) && new_text.length() == 4:
			wrong = 1
			
			
		if wrong:
			new_text = was_year
			$CanvasLayer/form/birdthday/year.text = was_year
			print("wrong")
			if new_text:
				$CanvasLayer/form/birdthday/year.caret_column = new_text.length()
			
	was_year = new_text
