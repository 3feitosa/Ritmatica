extends Label

var x1: int #numero 1 
var x2: int #numero 2
var resp:int #resposta
var simb: String #string com o símbolo da operacao (+,-,*,/)
var resps: String
var res #variável utilizada pra armazenar a matriz com a resolução
var ress: String
var tipo #tipo de operacao 
var buffer:String = ""
var respondida:bool = false

#await get_tree().create_timer(t).timeout#
func _ready() -> void:
	self.text = ""
#OBS: provavelmente vamos trocar isso pq essa line precisa confirmar p enviar a resposta, precisamos que ao digitar a resposta conte AUTOMATICAMENTE
func gerarconta(tipo): # função onde caso o parametro define o tipo de operação(+,-,*,/)
	x1 = randf_range(1, 5.0) # aqui vai selecionar um número de 0 a a 10 aleatoriamente
	x2 = randf_range(1, 5.0) # aq tbm
	
	var x
	
	if x1<x2:
		x = x1
		x1 = x2
		x2 = x
	
	if tipo == 0 : #caso 0, a conta vai ser uma soma
		resp = x1 + x2
		simb = "+"
	elif tipo == 1: #caso 1, subtração...
		resp = x1 - x2
		simb = "-" 
	elif tipo == 2: #caso 1, subtração...
		resp = x1 * x2
		simb = "x" 
	elif tipo == 3: #caso 1, subtração...
		resp = x1 / x2
		simb = "/" 
	return [x1,x2,resp] #retorna matriz

# func _ready() -> void:
	#var i:int = 0
	
	#while i != 10:
		#respondida = false
		#i += 1
		#var tp:int = randf_range(0,2)
		#
		#
		#res = gerarconta(tp)
		#x1 = res[0]
		#x2 = res[1]
		#resp = res[2]
		#ress = str(resp)
		#resps = str(resp)
		#
		#self.text = str(x1,simb,x2,"=","?", ) 
		#print(buffer)
		#await get_tree().create_timer(10).timeout
		#
		#
		#if respondida == false:
			#print("errou, tempo esgotadop")
		#

func _on_tempo():
	gerarconta(randf_range(0,4))

func _input(event) ->void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo() and not respondida:
		buffer += event.as_text_keycode()
		if buffer.length() == str(ress).length():
				if buffer == ress:
					print("Right")
					respondida = true	
					self.text = str(x1,simb,x2,"=",ress, " CERTO!") 
				else:
					print("Wrong")
					self.text = str(x1,simb,x2,"=",buffer, " ERRADO!") 
					respondida = true
				buffer =""
				


func _on_audio_stream_player_tempo() -> void:
	gerarconta(randf_range(0,3))
	
	respondida = false
	
	var tp:int = randf_range(0,3)
	
	res = gerarconta(tp)
	x1 = res[0]
	x2 = res[1]
	resp = res[2]
	ress = str(resp)
	resps = str(resp)
	
	self.text = str(x1,simb,x2,"=","?", ) 
	print(buffer)
	
	if respondida == false:
		print("errou, tempo esgotadop")
		
	
