require "alimento/version"
#module Alimento
class Alimentos
	attr_reader :name, :proteina, :carbohidratos, :lipidos, :gei, :terreno

	def initialize(name, proteina, carbohidratos, lipidos, gei, terreno)

		@name=name
		@proteina=Float(proteina)
		@carbohidratos=Float(carbohidratos)
		@lipidos=Float(lipidos)
		@gei=Float(gei)
		@terreno=Float(terreno)

	end

	def Nombre
		return @name
	end

	def GEI
		return @gei
	end

	def Terreno
		return @terreno
	end

	def to_s
		"\tAlimento\t= #{@name}\n\tProteinas\t= #{@proteina}\n\tCarbohidratos\t= #{@carbohidratos}\n\tLipidos\t= #{@lipidos}\n\tGEI\t= #{@gei}\n\tTerreno\t= #{@terreno}"

	end

	def Valor_energetico

	        @proteina * 4 + @carbohidratos * 4 + @lipidos * 9
	end


end
#end
