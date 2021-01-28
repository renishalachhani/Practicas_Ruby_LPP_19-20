



	def Energia(x)


		if x < 670
		       	en= 1
		elsif x >= 670 && x <= 830
			en= 2
		else
		        en= 3
		end
		return en
	end

	def Sal(x) 

		if x < 2
			s= 1
		elsif x >= 2 && x <= 3.3
			s= 2
		else
			s= 3
		end

		return s
	end

	def Fibra(x)


		if x > 8
			fi= 1
		elsif x <= 8 && x >= 6
			fi= 2
		else
			fi= 3
		end

		return fi
	end

	def AGS(x)

		if x < 6.7
			a= 1
		elsif x >= 6.7 && x <= 10
			a= 2
		else
			a= 3
		end

		return a 
	end

	def Huella_material(x)

		if x < 2670
			h_m= 1
		elsif x >= 2670 && x <= 4000
			h_m= 2
		else 
			h_m= 3
		end

		return h_m
	end

	def Huella_carbono(x)

		if x < 800
			h_c= 1
		elsif x >= 800 && x <= 1200 
			h_c= 2
		else 
			h_c= 3
		end

		return h_c
	end

	def Huella_hidrica(x)

		if x < 640 
			h_h= 1
		elsif x >= 640 && x <= 975 
			h_h= 2
		else
			h_h= 3
		end

		return h_h
	end

	def Terreno(x)

		if x < 1.25
			t= 1
		elsif x >= 1.25 && x <= 1.875
			t= 2
		else
			t= 3
		end

		return t
	end

	def Huella_Nutricional_Salud(a, b, c, d)
               
		((Float(Energia(a) + Sal(b) + AGS(c) + Fibra(d)))/4.0).round(2)
		

	end

	def Huella_Nutricional_Ambiental(a, b, c, d)

		((Float(Terreno(d) + Huella_material(a) + Huella_carbono(b) + Huella_hidrica(c)))/4.0).round(2)

	end

	def Huella_Nutricional(a, b, c, d, e, f, g, h)


		((Float(Huella_Nutricional_Salud(a, b, c, d) + Huella_Nutricional_Ambiental(e, f, g, h)))/2.0).round(2)
	end


