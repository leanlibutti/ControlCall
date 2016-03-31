

	dial = "12345678901234567890"


	if ("#{dial}".include? "-")

		puts "se debe analizar la transferencia"

	end

	if (dial[0] == "0")&&(dial[1] == "0")

		puts "la llamada es internacional"

		#hacer asignacion

	elsif (dial[0] == "0")

		puts "la llamada es nacional"

		#hacer asignacion		

	else 

		puts "la llamada es local"

	end