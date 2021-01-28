require './lib/alimento/alimento.rb'

require './lib/alimento/lista.rb'

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
			expect(@a4.Terreno).to eq(5.7)
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

			result = @hombre[0].terreno + @hombre[1].terreno +  @hombre[2].terreno
                        expect(result).to eq(173.79999999999998)
		end
		it "calcular el impacto ambiental de una mujer (GEI)" do

			result = (((@mujer[0].proteina * @mujer[0].gei)/1000) + ((@mujer[1].proteina * @mujer[1].gei)/1000) + ((@mujer[2].proteina * @mujer[2].gei)/1000))
			expect(result).to eq(0.0766)
		end
		it "calcular el impacto ambiental de una mujer (Terreno)" do

			result = @mujer[0].terreno +  @mujer[1].terreno +  @mujer[2].terreno
			expect(result).to eq(15.8)
		end

	end
                         

end



#--------------------------------------------------------------------------------------------------------------------------------------------
# PRUEBAS DE DOUBLY LINKED LISTS


RSpec.describe List do

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



		@n1 = Node.new(@a1, nil, nil)
		@n2 = Node.new(@a2, nil, nil)
		@n3 = Node.new(@a3, nil, nil)
		@n4 = Node.new(@n4, nil, nil)
		@n5 = Node.new(@n5, nil, nil)
		@n6 = Node.new(@n6, nil, nil)

		@l1 = List.new()

		@espanola = List.new()
		@vasca = List.new()
		@vegetaria = List.new()
		@vegetaliana = List.new()
		@locura = List.new()



	end

	context "Comprobar lista y nodo" do
		it "lista 1 esta vacia" do
			expect(@l1.head).to eq(nil)
			expect(@l1.tail).to eq(nil)
			expect(@l1.size).to eq(0)
		end
		it "comprobar nodo" do
			@node = Node.new(@a6, @a5, @a2)

			expect(@node.value).to eq(@a6)
			expect(@node.next).to eq(@a5)
			expect(@node.prev).to eq(@a2)
		end



	end

	context "Comprobar metodos" do

		it "insertar elemento en head" do
			@l1.Insert_head(@n1)
                        @l1.Insert_head(@n2)

                	@l1.Insert_head(@n3)
                	@l1.Insert_head(@n4)

			expect(@l1.Head).to eq(@n4)
			expect(@l1.Tail).to eq(@n1)
			expect(@l1.head.next.value).to eq(@n3)
			expect(@l1.head.prev).to eq(nil)
			expect(@l1.size).to eq(4)
		end
		it "insertar en tail" do

			@l1.Insert_tail(@n5)

			expect(@l1.Head).to eq(@n4)
			expect(@l1.Tail).to eq(@n5)
			expect(@l1.tail.next).to eq(nil)
			expect(@l1.tail.prev.value).to eq(@n1)
			expect(@l1.size).to eq(5)
		end
		it "insertar elementos en head" do
			a = [@n6, @n3, @n4]



			@l1.Insert_elements_head(a)

			expect(@l1.head.value).to eq(@n4)
			expect(@l1.head.next.value).to eq(@n3)
			expect(@l1.tail.value).to eq(@n5)
			expect(@l1.size).to eq(8)
		end
		it "insertar elementos en tail" do
			a = [@n1, @n5, @n2]

                        @l1.Insert_elements_tail(a)

			expect(@l1.head.value).to eq(@n4)
			expect(@l1.tail.prev.value).to eq(@n5)
			expect(@l1.tail.value).to eq(@n2)
			expect(@l1.size).to eq(11)

		end
		it "eliminar head" do


			expect(@l1.head.value).to eq(@n4)

			@l1.Remove_head

			expect(@l1.head.value).to eq(@n3)
			expect(@l1.head.prev).to eq(nil)

			expect(@l1.size).to eq(10)
		end
		it "eliminar tail" do


			expect(@l1.tail.value).to eq(@n2)

                        @l1.Remove_tail

			expect(@l1.tail.value).to eq(@n5)
			expect(@l1.tail.next).to eq(nil)

			expect(@l1.size).to eq(9)
		end
		it "eliminar todos elementos" do


			expect(@l1.head.value).to eq(@n3)
			expect(@l1.tail.value).to eq(@n5)

			@l1.Remove_all

			expect(@l1.head).to eq(nil)

			expect(@l1.Is_Empty).to eq(true)
		end


	end

	context "Dietas" do
		it "Española" do
			@espanola.Insert_tail(@a15)
			@espanola.Insert_tail(@a4)
			@espanola.Insert_tail(@a3)
			@espanola.Insert_tail(@a13)



			@Terreno = @espanola.head.value.terreno + @espanola.head.next.value.terreno + @espanola.tail.value.terreno + @espanola.tail.prev.value.terreno

			@GEI = (@espanola.head.value.gei + @espanola.head.next.value.gei + @espanola.tail.value.gei + @espanola.tail.prev.value.gei).round(2)


			expect(@Terreno).to eq(12.72)

			#Diario
			expect(@GEI).to eq(7.14)

			#Anual
			expect(@GEI*365).to eq(2606.1)
		end
		it "Vasca" do
                        @vasca.Insert_tail(@a15)

                        @vasca.Insert_tail(@a3)
                        @vasca.Insert_tail(@a13)



                        @Terreno = @vasca.head.value.terreno + @vasca.head.next.value.terreno + @vasca.tail.value.terreno

                        @GEI = (@vasca.head.value.gei + @vasca.head.next.value.gei + @vasca.tail.value.gei ).round(2)


			expect(@Terreno).to eq(7.02)

                        #Diario
			expect(@GEI).to eq(2.94)

                        #Anual
			expect(@GEI*365).to eq(1073.1)
		end

		it "vegetaria" do
                        @vegetaria.Insert_tail(@a15)
                        @vegetaria.Insert_tail(@a14)
                        @vegetaria.Insert_tail(@a8)
                        @vegetaria.Insert_tail(@a4)

			@Terreno = @vegetaria.head.value.terreno + @vegetaria.head.next.value.terreno + @vegetaria.tail.value.terreno + @vegetaria.tail.prev.value.terreno

                        @GEI = (@vegetaria.head.value.gei + @vegetaria.head.next.value.gei + @vegetaria.tail.value.gei + @vegetaria.tail.prev.value.gei).round(2)




			expect(@Terreno).to eq(20.2)

                        #Diario
			expect(@GEI).to eq(9.8)

                        #Anual
			expect((@GEI*365).round(2)).to eq(3577)
		end
		it "vegetaliana" do
                        @vegetaliana.Insert_tail(@a15)
                        @vegetaliana.Insert_tail(@a9)

                        @vegetaliana.Insert_tail(@a12)
                        @vegetaliana.Insert_tail(@a8)

			@Terreno = @vegetaliana.head.value.terreno + @vegetaliana.head.next.value.terreno + @vegetaliana.tail.value.terreno + @vegetaliana.tail.prev.value.terreno

                        @GEI = (@vegetaliana.head.value.gei + @vegetaliana.head.next.value.gei + @vegetaliana.tail.value.gei + @vegetaliana.tail.prev.value.gei).round(2)



                        expect(@Terreno).to eq(46.9)

                        #Diario
                        expect(@GEI).to eq(13.8)

                        #Anual
                        expect(@GEI*365).to eq(5037)
		end
		it "locura" do
                        @locura.Insert_tail(@a2)

                        @locura.Insert_tail(@a5)
                        @locura.Insert_tail(@a9)

			@Terreno = @locura.head.value.terreno + @locura.head.next.value.terreno + @locura.tail.value.terreno

                        @GEI = (@locura.head.value.gei + @locura.head.next.value.gei + @locura.tail.value.gei ).round(2)



                        expect(@Terreno).to eq(171.8)

                        #Diario
                        expect(@GEI).to eq(56.1)

                        #Anual
                        expect(@GEI*365).to eq(20476.5)
		end

	end


end

