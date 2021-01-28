require "alimento/version"
#module Alimento
class Alimentos

#Incluimos el modulo comparable 
	include Comparable



	attr_reader :name, :proteina, :carbohidratos, :lipidos, :gei, :terreno


#Inicializamos las variables
	
	def initialize(name, proteina, carbohidratos, lipidos, gei, terreno)

		@name=name
		@proteina=Float(proteina)
		@carbohidratos=Float(carbohidratos)
		@lipidos=Float(lipidos)
		@gei=Float(gei)
		@terreno=Float(terreno)

	end

#Metodo que devuelve el nombre
	

	def Nombre
		return @name
	end


#Metodo que devuelve el GEI
	


	def GEI
		return @gei
	end


#Metodo que devuelve el valor de Tereeno
	

	def Terreno
		return @terreno
	end


#Metodo to_s que devuelve el alimento formateado
	

	def to_s
		"\tAlimento\t= #{@name}\n\tProteinas\t= #{@proteina}\n\tCarbohidratos\t= #{@carbohidratos}\n\tLipidos\t= #{@lipidos}\n\tGEI\t= #{@gei}\n\tTerreno\t= #{@terreno}"

	end



#Metodo para obtener el valor Energético de un alimento
	
	def Valor_energetico

	        @proteina * 4 + @carbohidratos * 4 + @lipidos * 9
	end


#Metodo para comparar el valor energetico de dos alimentos
	

	def <=>(anOther)
                self.Valor_energetico <=> anOther.Valor_energetico
        end


	#Sobrecarga de suma

	def +(other)
		self.Valor_energtico + other.Valor_energetico
	end


end
#end
