require './lib/alimento.rb'

RSpec.describe Alimentos do
	before :all do 

		@a1 = Alimentos.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
		@a2 = Alimentos.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
		@a3 = Alimentos.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
		@a4 = Alimentos.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
		@a5 = Alimentos.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.4)
		@a6 = Alimentos.new("Salmon", 19.9, 0.0, 13.6, 6.0, 3.7)
		@a7 = Alimentos.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
		@a8 = Alimentos.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
		@a9 = Alimentos.new("Cafe", 0.1, 0.0, 0.0, 0.4, 0.3)
		@a10 = Alimentos.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
		@a11 = Alimentos.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
		@a12 = Alimentos.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
		@a13 = Alimentos.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
		@a14 = Alimentos.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
		@a15 = Alimentos.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
		
		@hombre = [@a5, @a6, @a4]
		@mujer = [@a4, @a7, @a8]
                
        end

        context "Probando que parametros existen" do
                it "debe tener un nombre" do
                        expect(@a1.name).to_not eq(nil)
                end
                it "debe tener proteinas" do
                        expect(@a1.proteina).to_not eq(nil)
                end
                it "debe tener carbohidratos" do
                        expect(@a1.carbohidratos).to_not eq(nil)
                end
                it "debe tener lipidos" do
                        expect(@a1.lipidos).to_not eq(nil)
                end
                it "debe tener GEI" do
                        expect(@a1.gei).to_not eq(nil)
                end
                it "debe tener terreno" do
                        expect(@a1.terreno).to_not eq(nil)
                end
        end


        context " Probando tipo de dato de los parámetros" do
                it "name debe ser un string" do
			expect(@a2.name).to be_kind_of(String)
		end
		it "proteina debe ser un float" do
                        expect(@a2.proteina).to be_kind_of(Float)
                end
		it "carbohidratos debe ser un float" do
                        expect(@a2.carbohidratos).to be_kind_of(Float)
                end
                it "lipidos debe ser un float" do
                        expect(@a2.lipidos).to be_kind_of(Float)
                end
		it "GEI debe ser un float" do
                        expect(@a2.gei).to be_kind_of(Float)
                end
		it "terreno debe ser un float" do
                        expect(@a2.terreno).to be_kind_of(Float)
                end
	end


	context "Probando los datos del alimento" do
		it "debe acceder al nombre" do
			expect(@a3.name).to eq("Chocolate")
		end
		it "debe acceder a proteinas" do
			expect(@a3.proteina).to eq(5.3)
		end
		it "debe acceder a carbohidratos" do
			expect(@a3.carbohidratos).to eq(47.0)
                end
		it "debe acceder a lipidos" do
			expect(@a3.lipidos).to eq(30.0)
                end
		it "debe acceder a GEI" do
			expect(@a3.gei).to eq(2.3)
                end
		it "debe acceder a terreno" do
			expect(@a3.terreno).to eq(3.4)
                end
	end

	context "Probar que accede a los metodos" do
		it "acceder al metodo de Nombre" do
			expect(@a4.Nombre).to eq("Huevos")
		end
		it "acceder al metodo GEI" do
			expect(@a4.GEI).to eq(4.2)
		end
		it "acceder al metodo Terreno" do
			expect(@a4.terreno).to eq(5.7)
		end
		it "acceder al metodo to_s" do
			expect(@a4.to_s).to eq("\tAlimento\t= Huevos\n\tProteinas\t= 13.0\n\tCarbohidratos\t= 1.1\n\tLipidos\t= 11.0\n\tGEI\t= 4.2\n\tTerreno\t= 5.7")
		end
		it "acceder al metodo de valor energetico" do
			expect(@a4.Valor_energetico).to eq(155.4)
		end

	end

	context "Hacer cálculos del impacto ambiental" do
		it "calcular el impacto ambiental de un hombre (GEI)" do
			
			result = (((@hombre[0].proteina * @hombre[0].gei)/1000) + ((@hombre[1].proteina * @hombre[1].gei)/1000) + ((@hombre[2].proteina * @hombre[2].gei)/1000))
			expect(result).to eq(1.2289999999999999)


		end
		it "calcular impacto ambiental de un hombre (Terreno)" do

			result = (((@hombre[0].proteina * @hombre[0].terreno)/1000) + ((@hombre[1].proteina * @hombre[1].terreno)/1000) + ((@hombre[2].proteina * @hombre[2].terreno)/1000))
                        expect(result).to eq(3.6165700000000003)
		end
		it "calcular el impacto ambiental de una mujer (GEI)" do

			result = (((@mujer[0].proteina * @mujer[0].gei)/1000) + ((@mujer[1].proteina * @mujer[1].gei)/1000) + ((@mujer[2].proteina * @mujer[2].gei)/1000))
			expect(result).to eq(0.0766)
		end
		it "calcular el impacto ambiental de una mujer (Terreno)" do

			result = (((@mujer[0].proteina * @mujer[0].terreno)/1000) + ((@mujer[1].proteina * @mujer[1].terreno)/1000) + ((@mujer[2].proteina * @mujer[2].terreno)/1000))
                        expect(result).to eq(0.24970000000000003)
		end

	end
                         

end


