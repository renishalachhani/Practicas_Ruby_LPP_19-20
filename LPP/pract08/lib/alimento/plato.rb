class Plato

	include Enumerable
	include Comparable

	attr_reader :name, :alimentos, :gramos, :proteinas, :lipidos, :carbo

	def initialize(name, alimentos, gramos, proteinas, lipidos, carbo)
		@name=name
		@alimentos = alimentos
		@gramos = gramos
		@proteinas = proteinas
		@lipidos = lipidos
		@carbo = carbo
		

	end

	def Name
		@name
	end

	def Proteinas
		r = 0
		n = @proteinas.head
		i = @gramos.head

		while !n.nil?

			r += ((n.value)*(i.value/100))
			n = n.next
			i = i.next
		end
		
		return (r*4).round(2)
	end

	def Carbohidratos
                r = 0
                n = @carbo.head
		i = @gramos.head


                while !n.nil?

			r += ((n.value)*(i.value/100))
                        n = n.next
			i = i.next
                end
                
		return (r*4).round(2)
        end

	def Lipidos
                r = 0
                n = @lipidos.head
		i = @gramos.head


                while !n.nil?

			r += ((n.value)*(i.value/100))
                        n = n.next
			i = i.next
                end
               
		return (r*9).round(2)
        end

	def VCT
		(self.Proteinas + self.Lipidos + self.Carbohidratos).round(2)
	end

	def Porcentaje_prot
		((self.Proteinas/self.VCT)*100).round(2)
	end

	def Porcentaje_lip
		((self.Lipidos/self.VCT)*100).round(2)
	end

	def Porcentaje_carb
		((self.Carbohidratos/self.VCT)*100).round(2)
	end

	def Gramos
		r = 0
                n = @gramos.head


		while !n.nil? 

			r += n.value 
                        n = n.next
                end

		(r).round(2)
	end

	def Gramos_prot

		r = 0
                n = @proteinas.head
                i = @gramos.head

                while !n.nil?

                        r += ((n.value)*(i.value/100))
                        n = n.next
                        i = i.next
                end

                return (r).round(2)
	
	end

	def Gramos_lip

		r = 0
                n = @lipidos.head
                i = @gramos.head

                while !n.nil?

                        r += ((n.value)*(i.value/100))
                        n = n.next
                        i = i.next
                end

                return (r).round(2)
	end

	def Gramos_carb

		r = 0
                n = @carbo.head
                i = @gramos.head

                while !n.nil?

                        r += ((n.value)*(i.value/100))
                        n = n.next
                        i = i.next
                end

                return (r).round(2)
	end

	def Alimentos
		r = ""
                n = @alimentos.head

                while !n.nil?

                        r += n.value + ", "
                        n = n.next
                end

                r
	end

	def to_s
		"\tPlato: #{name}\nAlimentos: #{self.Alimentos}\nPorcentaje Proteinas: #{self.Porcentaje_prot}\nPorcentaje Lipidos: #{self.Porcentaje_lip}\nPorcentaje Cerbohidratos: #{self.Porcentaje_carb}\nKcal total: #{self.VCT}" 
	end

	def each

                 n = @head
                 while !n.nil?
                         yield n.value
                         n = n.next


                 end

         end

	def <=>(anOther)
		self.VCT <=> anOther.VCT
        end




end



class Plato_herencia < Plato

	

	attr_reader :gei, :terreno

	def initialize(name, alimentos, gramos, proteinas, lipidos, carbo, gei, terreno)
		super(name, alimentos, gramos, proteinas, lipidos, carbo)

		@gei = gei
		@terreno = terreno

	end

	def GEI_total
		r = 0
                n = @gei.head
                i = @gramos.head

                while !n.nil?

                        r += ((n.value)*(i.value/100))
                        n = n.next
                        i = i.next
                end

                return (r).round(2)
	end

	def Terreno_total
		r = 0
                n = @terreno.head
                i = @gramos.head

                while !n.nil?

                        r += ((n.value)*(i.value/100))
                        n = n.next
                        i = i.next
                end

                return (r).round(2)
	end

	def to_s

		s= "( "
		s << super.to_s
		s << "\nGei Total: #{self.GEI_total}\nTerreno Total: #{self.Terreno_total} )"
		s
	end

	def <=>(anOther)
		self.GEI_total <=> anOther.GEI_total
	end



end

