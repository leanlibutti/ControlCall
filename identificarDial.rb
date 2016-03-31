


dial = "12345678901234567890"


descartar = false

j = 0

if (dial[0] == "<")&&(dial[1] == "I")&&(dial[2] == ">")

	puts "llamada entrante"
	dial = dial.delete "<>I"

elsif("#{dial[0]}".include? ?0)||("#{dial[0]}".include? ?1)||("#{dial[0]}".include? ?2)||("#{dial[0]}".include? ?3)||("#{dial[0]}".include? ?4)||
							("#{dial[0]}".include? ?5)||("#{dial[0]}".include? ?6)||("#{dial[0]}".include? ?7)||
							("#{dial[0]}".include? ?8)||("#{dial[0]}".include? ?9)

	puts "llamada saliente"

else

	puts "la llamada sera descartada"

	descartada = true

end


if !(descartada)
	puts "ahora vamos a procesar el number"
end


loop do 

	puts "#{dial[j]}"
	 	
	j += 1
			
	break if j > dial.length
end	