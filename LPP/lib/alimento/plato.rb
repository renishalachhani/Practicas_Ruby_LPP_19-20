class Plato


	#Incluir los modulos Enumerable y Comparable que lo hereda la clase hija
	

	include Enumerable
	include Comparable

	attr_reader :name, :alimentos, :gramos, :proteinas, :lipidos, :carbo


	#Inicializamo las variables
	
	def initialize(name, alimentos, gramos)
		@name=name
		@alimentos = alimentos
		@gramos = gramos
		
		

	end


	#Devuelve el nombre del Plato

	def Name
		@name
	end

	#Devuelve los gramos de los alimentos en el plato

	def Gramos
		@gramos
	end

	#Metodo que devuelve las kcal de proteinas de todos los alimentos respecto a los gramos de cada alimento

	def Proteinas
		r = 0
		n = @alimentos.head
		i = @gramos.head

		while !n.nil?

			r += ((n.value.proteina)*(i.value/100))
			n = n.next
			i = i.next
		end
		
		return (r*4).round(2)
	end


	#Metodo que devuelve las kcal de carbohidratos de todos los alimentos respecto a los gramos de cada alimento


	def Carbohidratos
                r = 0
                n = @alimentos.head
		i = @gramos.head


                while !n.nil?

			r += ((n.value.carbohidratos)*(i.value/100))
                        n = n.next
			i = i.next
                end
                
		return (r*4).round(2)
        end


	#Metodo que devuelve las kcal de lipidos de todos los alimentos respecto a los gramos de cada alimento


	def Lipidos
                r = 0
                n = @alimentos.head
		i = @gramos.head


                while !n.nil?

			r += ((n.value.lipidos)*(i.value/100))
                        n = n.next
			i = i.next
                end
               
		return (r*9).round(2)
        end

	#Calcula el valor energetico total de los alimentos en el plato

	def VCT
		(self.Proteinas + self.Lipidos + self.Carbohidratos).round(2)
		
		
	end

	#Devuelve el porcentaje total de proteinas en el plato

	def Porcentaje_prot
		((self.Proteinas/self.VCT)*100).round(2)
	end


	#Devuelve el porcentaje total de lipidos en el plato


	def Porcentaje_lip
		((self.Lipidos/self.VCT)*100).round(2)
	end

	#Devuelve el porcentaje total de carbohidratos en el plato


	def Porcentaje_carb
		((self.Carbohidratos/self.VCT)*100).round(2)
	end


	# Devuelve el totl de gramos de los alimentos

	def Gramos_total
		r = 0
                n = @gramos.head


		while !n.nil? 

			r += n.value 
                        n = n.next
                end

		(r).round(2)
	end

	#Metodo para obtener los gramos totales de proteina de un plato

	def Gramos_prot

		r = 0
                n = @alimentos.head
                i = @gramos.head

                while !n.nil?

                        r += ((n.value.proteina)*(i.value/100))
                        n = n.next
                        i = i.next
                end

                return (r).round(2)
	
	end

	#Metodo para obtener los gramos totales de lipidos de un plato


	def Gramos_lip

		r = 0
                n = @alimentos.head
                i = @gramos.head

                while !n.nil?

                        r += ((n.value.lipidos)*(i.value/100))
                        n = n.next
                        i = i.next
                end

                return (r).round(2)
	end

	#Metodo para obtener los gramos totales de carbohidratos de un plato


	def Gramos_carb

		r = 0
                n = @alimentos.head
                i = @gramos.head

                while !n.nil?

                        r += ((n.value.carbohidratos)*(i.value/100))
                        n = n.next
                        i = i.next
                end

                return (r).round(2)
	end

	#Metodo para obtener los nombres de los alimentos del plato

	def Alimentos
		r = ""
                n = @alimentos.head

                while !n.nil?

			r += n.value.name + ", "
                        n = n.next
                end

                r
	end

	#Devuelve el plato formateado

	def to_s
		"\tPlato: #{name}\nAlimentos: #{self.Alimentos}\nPorcentaje Proteinas: #{self.Porcentaje_prot}\nPorcentaje Lipidos: #{self.Porcentaje_lip}\nPorcentaje Cerbohidratos: #{self.Porcentaje_carb}\nKcal total: #{self.VCT}" 
	end

	#Metodo para hacer Plato enumerable

	def each

                 n = @alimentos.head
                 while !n.nil?
                         yield n.value
                         n = n.next


                 end

        end

	#Metodo para comparar el valor calorico total de los platos

	def <=>(anOther)
		self.VCT <=> anOther.VCT
        end




end



class Plato_herencia < Plato

	

	attr_reader :gei, :terreno

	#Inicializar las variables

	def initialize(name, alimentos, gramos)
		super(name, alimentos, gramos)

	end

	#Devuelve el GEI total del plato

	def GEI_total
		r = 0
                n = @alimentos.head
                i = @gramos.head

                while !n.nil?

                        r += ((n.value.gei)*(i.value/100))
                        n = n.next
                        i = i.next
                end

		

                return (r).round(2)
	end

	#Devuelve el terreno total del plato

	def Terreno_total
		r = 0
                n = @alimentos.head
                i = @gramos.head

                while !n.nil?

                        r += ((n.value.terreno)*(i.value/100))
                        n = n.next
                        i = i.next
                end

                return (r).round(2)
	end


	#Metodo to_s para el plato heredado formateado
	


	def to_s

		s= "( "
		s << super.to_s
		s << "\nGei Total: #{self.GEI_total}\nTerreno Total: #{self.Terreno_total} )"
		s
	end


	#Funcion Para sumar los indices


	def Reduce(arr)

                return arr.reduce(0, :+)
        end


	#Funcion para calcular el indice total de vct de alimetos del plato

	def new_VCT
	n=0
	r=0
	a = Array.new
	x = @gramos.head
	@alimentos.map{ |i|
		
		n = i.Valor_energetico*(x.value/100)
		x = x.next
		a << 1.0 if n<670
                a << 2.0 if n>=670 && n<=830
                a << 3.0 if n>830
	}
	r = self.Reduce(a)
	return (Float(r/@alimentos.Size)).round(1)
	end

	#Funcion para calcular el indice total de gei de alimentos del plato

	def new_GEI
		n=0
		r=0
		a = Array.new
		x = @gramos.head
		@alimentos.map{ |i|
			n = i.gei*(x.value/100)
			x = x.next
			a << 1.0 if n<800
			a << 2.0 if n>=800 && n<=1200
			a << 3.0 if n>1200

				 
		}
		r = self.Reduce(a)

		return (Float(r/@alimentos.Size)).round(1)
	end

	#Devuelve la huella nutricional de un plato
	
	def new_Huella_nutricional
		((Float(self.new_VCT + self.new_GEI))/2).round(1)
	end

	#Metodo para conseguir el max plato segun la huella nutricional en un menu de varios platos

	def <=>(anOther)
                self.new_Huella_nutricional <=> anOther.new_Huella_nutricional
        end


        
end

