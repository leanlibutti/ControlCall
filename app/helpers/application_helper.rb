require 'date'
require 'constant'
require 'time'
require 'proveedor'

module ApplicationHelper


#metodos leerArchivo cargarLocalidad cargarCodigoPaises cotizarLlamada

def guardarLlamadas()
 

	#leo el archivo y lo guardo en un array


	arch = File.open("putty.log", "r")
	array = arch.readlines

#				pais.name = "#{pais.name}".strip




	array.each_index do |i|
		llamada = Call.new
		array[i] = "#{array[i]}".chomp

		aux = "#{array[i]}"

		if ("#{aux[0]}".include? ?0)||("#{aux[0]}".include? ?1)||("#{aux[0]}".include? ?2)||("#{aux[0]}".include? ?3)||("#{aux[0]}".include? ?4)||
									("#{aux[0]}".include? ?5)||("#{aux[0]}".include? ?6)||("#{aux[0]}".include? ?7)||
									("#{aux[0]}".include? ?8)||("#{aux[0]}".include? ?9)


			j = 0

			date = ""
			time = ""
			co = ""
			ring = ""
			duration = ""
			acc = ""
			cd = ""
			dial = ""

			#opcion 1

=begin
			loop do 
					

					if  (j  >= 0)&&(j < 8)

					 	date = "#{date}" + "#{aux[j]}" 

					  elsif (j  >= 8)&&(j < 15)
						time = "#{time}" + "#{aux[j]}"

	 				  elsif (j  >= 15)&&(j < 19)
						llamada.extension = "#{llamada.extension}" + "#{aux[j]}"		  		  
			  		  
			  		  elsif (j  >= 19)&&(j < 21)
			  		  	co =  "#{co}" + "#{aux[j]}"
			  		  
			  		  elsif (j  >= 21)&&(j < 44)
			  		  	dial = "#{dial}" + "#{aux[j]}"
			 		  
			 		  elsif (j  >= 44)&&(j < 48)

			  		  	ring = "#{ring}" + "#{aux[j]}"

			  		 elsif (j  >= 48)&&(j < 56)

			  		  	duration = "#{duration}" + "#{aux[j]}"

					 elsif (j  >= 56)&&(j < 67)

			  		  	acc = "#{acc}" + "#{aux[j]}"
			  		  		  		  
					 elsif (j  >= 67)&&(j < 80)

			  		  	llamada.cd = "#{llamada.cd}" + "#{aux[j]}"
			  		  		  		  
			  		  else
						llamada.outgoing = true
			  		end
					
					j += 1
				
					break if j > aux.length
				end			
=end	 
				#opcion 2

					
					#cargo fecha
			while (aux[j] != " ")

			 	date = "#{date}" + "#{aux[j]}" 
			 	j += 1

			 end

			while (aux[j] == " ")

			 	j += 1

			 end

				 #cargo hora
			while (aux[j] != " ")

				time = "#{time}" + "#{aux[j]}"
			 	j += 1

			 end

			while (aux[j] == " ")

			 	j += 1

			 end

					 #cargo extension

			while (aux[j] != " ")

				llamada.extension = "#{llamada.extension}" + "#{aux[j]}"		  		  
			 	j += 1

			 end

			while (aux[j] == " ")

			 	j += 1

			 end					 

			 #cargo CO
					 
			while (aux[j] != " ")

	  		  	co =  "#{co}" + "#{aux[j]}"
  		  	 	j += 1

			 end


 			#guardo CO, si hay una E significa que la llamada es de extension
 			# y debe descartarse


 			llamada.co = "#{co}".to_i

 			descartada2 = false

 			if (co[0] == "E")&&(co[1] == "X")&&(co[2] == "T")

 				descartada2 = true

	 		end

	 		if !(descartada2)

				while (aux[j] == " ")

				 	j += 1

				 end					 

				 #cargo dial number

						 
				while (aux[j] != " ")

		  		  	dial = "#{dial}" + "#{aux[j]}"
	  		  	 	j += 1

				 end

				while (aux[j] == " ")

				 	j += 1

				 end						 

			end
=begin



			  		  elsif (j  >= 19)&&(j < 21)
			  		  	co =  "#{co}" + "#{aux[j]}"
			  		  
			  		  elsif (j  >= 21)&&(j < 44)
			  		  	dial = "#{dial}" + "#{aux[j]}"
			 		  
			 		  elsif (j  >= 44)&&(j < 48)

			  		  	ring = "#{ring}" + "#{aux[j]}"

			  		 elsif (j  >= 48)&&(j < 56)

			  		  	duration = "#{duration}" + "#{aux[j]}"

					 elsif (j  >= 56)&&(j < 67)

			  		  	acc = "#{acc}" + "#{aux[j]}"
			  		  		  		  
					 elsif (j  >= 67)&&(j < 80)

			  		  	llamada.cd = "#{llamada.cd}" + "#{aux[j]}"
			  		  		  		  
			  		  else
						llamada.outgoing = true
			  		end
					
					j += 1
				
					break if j > aux.length
				end			

=end
				#cargar campos


 			year = "20"
			year = "#{year}#{date[6]}#{date[7]}".to_i

			month = "#{date[3]}#{date[4]}".to_i

			day = "#{date[0]}#{date[1]}".to_i

			llamada.call_date = Date.new(year, month, day)



			hour = "#{time[0]}#{time[1]}".to_i

 			min = "#{time[3]}#{time[4]}".to_i


 			type = "#{time[5]}#{time[6]}"

 			if ("#{type}" == "PM") 

 				hour += 12

 			end


 			llamada.call_time = Time.new(year, month, day, hour, min, 0, "+00:00")
	 			

			min = "#{ring[0]}".to_i

		 	seg = "#{ring[2]}#{ring[3]}".to_i


			total = min * 60 + seg

			llamada.ring = total	

	 			
 			hour = "#{duration[0]}#{duration[1]}".to_i

 			min = "#{duration[3]}#{duration[4]}".to_i

 			seg = "#{duration[6]}#{duration[7]}".to_i


  			llamada.duration = Time.new(2012, 2, 25, hour, min, seg, "+00:00")
	 			


 			llamada.acc_code = "#{acc}".to_i

 			llamada.dial_number = "#{dial}"






 			# se identifica al dial
				descartada1 = false

				j = 0

				#verifico que no este descartada

				if !(descartada2)
			
					if (llamada.dial_number[0] == "<")&&(llamada.dial_number[1] == "I")&&(llamada.dial_number[2] == ">")

						# llamada entrante

						llamada.incoming = true
						llamada.outgoing = false

						llamada.dial_number = llamada.dial_number.delete "<>I"

					elsif("#{llamada.dial_number[0]}".include? ?0)||("#{llamada.dial_number[0]}".include? ?1)||("#{llamada.dial_number[0]}".include? ?2)||("#{llamada.dial_number[0]}".include? ?3)||("#{llamada.dial_number[0]}".include? ?4)||
												("#{llamada.dial_number[0]}".include? ?5)||("#{llamada.dial_number[0]}".include? ?6)||("#{llamada.dial_number[0]}".include? ?7)||
												("#{llamada.dial_number[0]}".include? ?8)||("#{llamada.dial_number[0]}".include? ?9)

						# llamada saliente

						llamada.incoming = false
						llamada.outgoing = true



					else

						puts "la llamada sera descartada"

						descartada1 = true

					end

				end

=begin

				if !(descartada1)

					#se procesa el dial
						if ("#{llamada.dial_number}".include? "-")
							#ver campo :cd si es "tr"
							 #sumar lo de los cds

							# se debe analizar la transferencia

						end


							if (llamada.dial_number[0] == "0")&&(llamada.dial_number[1] == "0")

								# la llamada es internacional
								# si es uno es EEUU


								llamada.destiny = "internacional"

							elsif (llamada.dial_number[0] == "0")

								# la llamada es nacional

								llamada.destiny = "nacional"

							else 

								# la llamada es local

								llamada.destiny = "local"

							end





				end
=end
	#			cotizarLlamada(id)


				#guardo la llamada, verifico que no este descartada

				if !(descartada2)
	 			
	 				llamada.save

	 			end

=begin

	 			if (llamada.duration.sec < 5)&&(llamada.outgoing)

					puts "Hola"
				else 
					llamada.save
				end

=end
	
	
			end

		end	

	end






	def cargarPaises()

		if (Country.all.count == 0)



				#leo el archivo y lo guardo en un array


				arch = File.open("paisescoef.txt", "r")
				array = arch.readlines


				franco_oro = 0.4144


				array.each_index do |i|
					pais = Country.new
					array[i].chomp




					j = 0
					aux = array[i]


					loop do 
						
						pais.name = "#{pais.name}" + "#{aux[j]}"
				 
						j += 1
					
						break if ("#{aux[j]}".include? ?0)||("#{aux[j]}".include? ?1)||("#{aux[j]}".include? ?2)||("#{aux[j]}".include? ?3)||("#{aux[j]}".include? ?4)||
										("#{aux[j]}".include? ?5)||("#{aux[j]}".include? ?6)||("#{aux[j]}".include? ?7)||("#{aux[j]}".include? ?8)||("#{aux[j]}".include? ?9)


					end			

					pais.name = "#{pais.name}".strip



					auxf = ""

					for m in (1..4)

						auxf = "#{auxf}" + "#{aux[j]}"
						j += 1

					end
					pais.coef_n1 = 0.00

					auxf = "#{auxf.tr(',', '.')}"
					pais.coef_n1 = "#{auxf}".to_f

					pais.coef_n1 = pais.coef_n1 / franco_oro



					j += 1

					auxf = ""

					for m in (1..4)

						auxf = "#{auxf}" + "#{aux[j]}"
						j += 1

					end


					auxf = "#{auxf.tr(',', '.')}"
					pais.coef_n2 = "#{auxf}".to_f

					pais.coef_n2 = pais.coef_n2 / franco_oro



					j += 1

					auxf = ""

					for m in (1..4)

						auxf = "#{auxf}" + "#{aux[j]}"
						j += 1

					end


					auxf = "#{auxf.tr(',', '.')}"
					pais.coef_r1 = "#{auxf}".to_f
					pais.coef_r1 = pais.coef_r1 / franco_oro





					j += 1

					auxf = ""

					for m in (1..4)

						auxf = "#{auxf}" + "#{aux[j]}"
						j += 1

					end


					auxf = "#{auxf.tr(',', '.')}"
					pais.coef_r2 = "#{auxf}".to_f
					pais.coef_r2 = pais.coef_r2 / franco_oro


					pais.save
				end

			cargarCodigoPaises


		   end

	end


def cargarCodigoPaises()



	#leo el archivo y lo guardo en un array


	arch = File.open("paisescod.txt", "r")
	array = arch.readlines



	array.each_index do |i|
		array[i].chomp




		j = 0
		aux = array[i]

		nombre = ""

		loop do 
			
			nombre = "#{nombre}" + "#{aux[j]}"
	 
			j += 1
		
			break if ("#{aux[j]}".include? ?0)||("#{aux[j]}".include? ?1)||("#{aux[j]}".include? ?2)||("#{aux[j]}".include? ?3)||("#{aux[j]}".include? ?4)||
							("#{aux[j]}".include? ?5)||("#{aux[j]}".include? ?6)||("#{aux[j]}".include? ?7)||
							("#{aux[j]}".include? ?8)||("#{aux[j]}".include? ?9)

		end			


		codigo = ""

	

		for k in (1..3)

			codigo = "#{codigo}" + "#{aux[j]}"
		    j += 1

		end


		codigo = "#{codigo}".strip


		nombre = "#{nombre}".strip


		if (Country.where("name = '#{nombre}'").count == 1)	


			arreglo = Country.where("name = '#{nombre}'")

			var = arreglo[0].id

			pais = Country.find(var)

			var = "#{codigo}".to_i
			
			pais.code = var

			pais.save

		end







	end


end




def cargarLocalidad()

	if (Localidad.all.count == 0)

		localidad = Localidad.new

		localidad.name = "Choele Choel"

		localidad.interurbano = 2946	

		localidad.clave_nqn = 5

		localidad.save


		localidad = Localidad.new

		localidad.name = "Zapala"

		localidad.interurbano = 2942	

		localidad.clave_nqn = 5

		localidad.save


		localidad = Localidad.new

		localidad.name = "General Roca"

		localidad.interurbano = 298	

		localidad.clave_nqn = 2

		localidad.save


		localidad = Localidad.new

		localidad.name = "Neuquen1"

		localidad.interurbano = 44	

		localidad.clave_nqn = 0

		localidad.save


		localidad = Localidad.new

		localidad.name = "Neuquen2"

		localidad.interurbano = 43	

		localidad.clave_nqn = 0

		localidad.save



		localidad = Localidad.new

		localidad.name = "San Patricio del Chanar"

		localidad.interurbano = 485	

		localidad.clave_nqn = 2

		localidad.save


		localidad = Localidad.new

		localidad.name = "Rincon de los Sauces"

		localidad.interurbano = 488	

		localidad.clave_nqn = 3

		localidad.save


		localidad = Localidad.new

		localidad.name = "Centenario"

		localidad.interurbano = 489	

		localidad.clave_nqn = 0

		localidad.save


		localidad = Localidad.new

		localidad.name = "Catriel"

		localidad.interurbano = 491	

		localidad.clave_nqn = 3

		localidad.save


		localidad = Localidad.new

		localidad.name = "Senillosa"

		localidad.interurbano = 492	

		localidad.clave_nqn = 2

		localidad.save

		
		localidad = Localidad.new

		localidad.name = "Plottier"

		localidad.interurbano = 493	

		localidad.clave_nqn = 0

		localidad.save



		localidad = Localidad.new

		localidad.name = "Colonia 25 de Mayo"

		localidad.interurbano = 494	

		localidad.clave_nqn = 3

		localidad.save


		localidad = Localidad.new

		localidad.name = "Contralmirante Corder"

		localidad.interurbano = 495

		localidad.clave_nqn = 0

		localidad.save


		localidad = Localidad.new

		localidad.name = "Cutral Co"

		localidad.interurbano = 496	

		localidad.clave_nqn = 3

		localidad.save


		localidad = Localidad.new

		localidad.name = "Villa Manzano"

		localidad.interurbano = 497

		localidad.clave_nqn = 2

		localidad.save


		localidad = Localidad.new

		localidad.name = "Cinco Saltos"

		localidad.interurbano = 498	

		localidad.clave_nqn = 0

		localidad.save


		localidad = Localidad.new

		localidad.name = "General Fernandez Oro"

		localidad.interurbano = 499	

		localidad.clave_nqn = 0

		localidad.save


		localidad = Localidad.new

		localidad.name = "Villa el Chocon"

		localidad.interurbano = 4901

		localidad.clave_nqn = 3

		localidad.save


		localidad = Localidad.new

		localidad.name = "Arroyito del Chocon"

		localidad.interurbano = 4902	

		localidad.clave_nqn = 2

		localidad.save


		localidad = Localidad.new

		localidad.name = "Las Perlas"

		localidad.interurbano = 4903

		localidad.clave_nqn = 0

		localidad.save			



		localidad = Localidad.new

		localidad.name = "Anelo"

		localidad.interurbano = 4904

		localidad.clave_nqn = 3

		localidad.save	



		localidad = Localidad.new

		localidad.name = "Barda del Medio"

		localidad.interurbano = 4908

		localidad.clave_nqn = 0

		localidad.save

	end

end 

def cargarProveedores()

	if (Proveedor.all.count == 0)

		prove = Proveedor.new

		prove.name = "Telfonica"

		constant = Constant.new

		constant.proveedor_id = prove.id

		constant.franco_oro = 0.0414

		constant.ficha_local = 0.0469

		constant.unidad_aire = 0.50

		constant.bloque_30 = 0.50

		constant.IVA = 0.21

		prove.constant = constant

		prove.save


		prove = Proveedor.new

		prove.name = "Telecom"

		constant = Constant.new

		constant.proveedor_id = prove.id

		constant.franco_oro = 0.0414

		constant.ficha_local = 0.0496

		constant.unidad_aire = 0.50

		constant.IVA = 0.21


		constant.bloque_30 = 0.30

		prove.constant = constant

		prove.save


		prove = Proveedor.new

		prove.name = "Claro"

		constant = Constant.new

		constant.proveedor_id = prove.id

		constant.franco_oro = 0.0414

		constant.ficha_local = 0.0496

		constant.unidad_aire = 0.50

		constant.IVA = 0.21

		constant.bloque_30 = 0.30

		prove.constant = constant

		prove.save

	
		prove = Proveedor.new

		prove.name = "Movistar"

		constant = Constant.new

		constant.proveedor_id = prove.id

		constant.franco_oro = 0.0414

		constant.ficha_local = 0.0496

		constant.unidad_aire = 0.50

		constant.IVA = 0.21

		constant.bloque_30 = 0.30

		prove.constant = constant

		prove.save


		prove = Proveedor.new

		prove.name = "Sip1"

		constant = Constant.new

		constant.proveedor_id = prove.id

		constant.franco_oro = 0.0414

		constant.ficha_local = 0.0496

		constant.unidad_aire = 0.50

		constant.IVA = 0.21

		constant.bloque_30 = 0.30

		prove.constant = constant

		prove.save


		prove = Proveedor.new

		prove.name = "Sip1"

		constant = Constant.new

		constant.proveedor_id = prove.id

		constant.franco_oro = 0.0414

		constant.ficha_local = 0.0496

		constant.unidad_aire = 0.50

		constant.IVA = 0.21

		constant.bloque_30 = 0.30

		prove.constant = constant

		prove.save



	end

end

def cargarFichasNacionales()


	if (Fichan.all.count == 0)


		ficha = Fichan.new

		ficha.code = 2

		ficha.valor_sec_n = 0.0027476768

		ficha.valor_sec_r = 0.0020303030

		ficha.valor_min_n = 0.16

		ficha.valor_min_r = 0.12

		ficha.description = "más de 30/55 Km"

		ficha.save


		ficha = Fichan.new

		ficha.code = 3

		ficha.valor_sec_n = 0.0032484848

		ficha.valor_sec_r = 0.0023686869

		ficha.valor_min_n = 0.19

		ficha.valor_min_r = 0.14

		ficha.description = "más de 55/110 Km"

		ficha.save


		ficha = Fichan.new

		ficha.code = 4

		ficha.valor_sec_n = 0.0059166414

		ficha.valor_sec_r = 0.0040606061

		ficha.valor_min_n = 0.35

		ficha.valor_min_r = 0.24

		ficha.description = "más de 110/170 Km"

		ficha.save



		ficha = Fichan.new

		ficha.code = 5

		ficha.valor_sec_n = 0.0065815657

		ficha.valor_sec_r = 0.0050757576

		ficha.valor_min_n = 0.39

		ficha.valor_min_r = 0.30

		ficha.description = "más de 170/240 Km"

		ficha.save



		ficha = Fichan.new

		ficha.code = 6

		ficha.valor_sec_n = 0.0094155303

		ficha.valor_sec_r = 0.0076982323

		ficha.valor_min_n = 0.56

		ficha.valor_min_r = 0.46

		ficha.description = "más de 240 Km"

		ficha.save


	end

end





def cotizarLlamada(id)


	if (Call.all.count == 0)

	#	llamada = Call.find(id)


		llamada = Call.new

		llamada.cell = false

		llamada.destiny = "internacional"

		llamada.call_date =  Date.new(2016,3,5)

		llamada.call_time = Time.new(2016,3,5, 19, 2, 2, "+02:00")

		llamada.duration = Time.new(2016,3,5, 0, 2, 2, "+02:00")

		llamada.clave = 1

		reducida = true

		llamada.proveedor_id = 11

	#variables auxiliares del metodo

		tiempo_m = llamada.duration.hour * 60 + llamada.duration.min

		tiempo_s = llamada.duration.hour * 3600 + llamada.duration.min * 60 + llamada.duration.sec

		tiempo_min = tiempo_m.to_f

		tiempo_sec = tiempo_s.to_f

	#casp local
		prove = Proveedor.find(llamada.proveedor_id)

		ficha_local = prove.constant.ficha_local



#constantes auxiliares


		ficha_nacional = 0.60

		pulso_30 = 1.00

		primeros30 = 1.12 
		
		unidad_aire = 0.80

	#cuerpo del metodo

		if !(llamada.cell)

		#es fijo
		
			if (llamada.destiny == "local")

				#es local

			
				if (llamada.call_date.monday?) 

					#fue hecha un domingo 

					reducida = true

				elsif (llamada.call_date.saturday?) 
						
					#fue hecha un sabado 
					
					if (llamada.call_time.hour >= 8)&&(llamada.call_time.hour < 13)

						#fue hecha despues de las ocho y antes de las 13

						reducida = false

					end

				elsif (llamada.call_time.hour >= 8)&&(llamada.call_time.hour < 20)


					reducida = false

				end

	#solo para version de prueba

				llamada.outgoing = reducida

				llamada.co = tiempo_min

				llamada.extension = tiempo_min / 4.00



				if !(reducida)


					llamada.cost =  (tiempo_min / 2.00 + 1.00) * ficha_local



				else 	

					llamada.cost =  (tiempo_min / 4.00 + 1.00) * ficha_local


					#es reducida
				end




			elsif (llamada.destiny == "nacional")

				#busco la clave

				clave_nacional = 5

				fichan = Fichan.where("code = '#{clave_nacional}'").first


				bloque_30 = prove.constant.bloque_30



				#solo para version de prueba

				llamada.outgoing = reducida

				llamada.co = tiempo_sec

				llamada.extension = fichan.valor_sec_r

				llamada.cd = bloque_30			



			




				puts "Es Nacional"

				if (llamada.call_date.monday?) 

					puts "Fue hecha un domingo"

					reducida = true

				elsif (llamada.call_date.saturday?) 
					
					puts "Fue hecha un sabado"

					if (llamada.call_time.hour >= 8)&&(llamada.call_time.hour < 13)

						puts "Fue hecha despues de las ocho y antes de las 13"

						reducida = false

					end

				elsif (llamada.call_time.hour >= 8)&&(llamada.call_time.hour < 21)

					puts "Fue hecha durante la semana"

					reducida = false

				end



				if !(reducida)

					#tarifa normal

					# si es mayor o menor a 30 seg

					tiempo_sec = tiempo_sec - 30.00

					if (tiempo_sec > 30)

						tiempo_sec = tiempo_sec - 30.00


						llamada.cost = bloque_30 + tiempo_sec * fichan.valor_sec_n

					else 

						llamada.cost = bloque_30


					end	



				else 	

					#tarifa reducida

					if (tiempo_sec > 30)

						llamada.cost = bloque_30 + tiempo_sec * fichan.valor_sec_r

					else 

						llamada.cost = bloque_30


					end	




				end


			else

				#llamada internacional, mismo criterio que para llamadas locales

				#se usa el codigo de pais

				#no se tiene en cuenta si es reducida o no


				pais = Country.where("code = '#{llamada.clave}'").first




				bloque_30 = prove.constant.bloque_30

				#solo para version de prueba

				llamada.outgoing = reducida

				llamada.co = tiempo_min

				llamada.extension = pais.name

				llamada.cd = pais.coef_n1	

				#operaciones necesarias

				pais.coef_n1 = pais.coef_n1 * prove.constant.franco_oro

				pais.coef_n2 = pais.coef_n2 * prove.constant.franco_oro




				#discriminar primer minuto

				if (tiempo_min > 0)

					llamada.cost = pais.coef_n1	+ (tiempo_min / 2 + 1).to_f * pais.coef_n2	

				else

					llamada.cost = pais.coef_n1

				end


			end




		else

			#es a un celular

			if (llamada.destiny == "nacional")||(llamada.destiny == "local")
				
				puts "Es nacional o local"
				llamada.cost = primeros30 +  tiempo_sec * unidad_aire

			else
				#es igual que el fijo

				puts "Es internacional"

				c =  (tiempo_min / 2 + 1) * ficha_nacional	

				llamada.cost =  c.to_f

				puts "el tiempo es #{tiempo_min} "

				puts "el costo es #{llamada.cost} "


			end
		



			#multiplicar por el IVA
		end

		llamada.save

	end

end





end
