class CallPdf < Prawn::Document
	def initialize #(calls)
		super 
		"Las llamadas van aca"

		#@calls = calls
		#line_items
	end

	def line_items
		move_down 20
		table line_items_rows do
			row(0).font_style = :bold
		end
	end

	def line_items_rows
		[["Tipo de LLamada", "Numero de Dial", "Fecha", "Hora", "Tiempo de Espera", "Duracion", "Costo"]] + 
		@calls.line_items.map do |call|
			if (call.incoming?)
				["Entrante", call.dial_number, call.call_date, call.call_time, call.ring, call.duration, call.cost]
			else
				["Saliente", call.dial_number, call.call_date, call.call_time, call.ring, call.duration, call.cost]
			end
		end
	end
end