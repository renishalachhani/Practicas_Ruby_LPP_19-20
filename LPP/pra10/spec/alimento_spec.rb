require './lib/alimento/alimento.rb'
require './lib/alimento/plato.rb'
require './lib/alimento/lista.rb'
require './lib/alimento/menu.rb'

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


#----------------------------------------------------------------------------------------------------------------------------------
#COMPARBLES	

	context "Instancias Comparables" do

		it "Mayor" do
			expect(@a15 > @a11).to eq(true)
			expect(@a9 > @a7).to eq(false)
		end
		it "Menor" do
			expect(@a1 < @a3).to eq(true)
			expect(@a14 < @a9).to eq(false)
		end
		it "Igual" do
			expect(@a8 == @a10).to eq(false)
			
			huevos = Alimentos.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
			expect(@a4 == huevos).to eq(true)
		end
		it "menor igual" do
			expect(@a1 <= @a3).to eq(true)
		end
		it "mayor igual" do
			expect(@a15 >= @a4).to eq(true)
		end
		it "between" do
			expect(@a10.between?(@a9, @a15)).to eq(true)
			expect(@a15.between?(@a4, @a2)).to eq(false)
		end

	end
                         

end



#--------------------------------------------------------------------------------------------------------------------------------------------
# PRUEBAS DE DOUBLY LINKED LISTS

describe List do

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
		@l2 = List.new()

		@l2.Insert_tail("nodo1")
		@l2.Insert_tail("nodo2")
		@l2.Insert_tail("nodo3")

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
#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#ENUMERABLES

	context " prueba enumerable" do
		it " each " do
			result = ""
			@l2.each do |i|
				result +=  i + "\n" 
			end

			expect(result).to eq("nodo1\nnodo2\nnodo3\n")
		end
		it " sort" do

			@l1.Insert_tail(@a1)
			@l1.Insert_tail(@a2)
			@l1.Insert_tail(@a3)
			@l1.Insert_tail(@a4)




			expect(@l1.sort).to eq([@a2,@a4,@a1,@a3])
		end

		it "collect" do
			
			expect(@l1.collect{|i| i.name}).to eq(["Carne de cordero", "Pollo", "Chocolate", "Huevos"])
		end
		it "select" do
			expect(@l1.select{ |i| i.terreno.between?(5,100)}).to eq([@a2,@a4])
		end
		it "max" do
			expect(@l1.max).to eq(@a3)
		end
		it "min" do
			expect(@l1.min).to eq(@a2)
		end

 

	end



end











#---------------------------------------------------------------------------------------------------------------------------------------------------------------
#Pruebas de Clase Plato







describe Plato do
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


		@list = List.new()
		

		@list.Insert_head(@a2)
		@list.Insert_head(@a3)
		@list.Insert_head(@a4)
		@gr = List.new()
		@gr.Insert_head(70.0)
		@gr.Insert_head(15.0)
		@gr.Insert_head(35.0)


		@p1 = Plato.new("Plato1", @list, @gr)

		@plato_herencia = Plato_herencia.new("Plato2", @list, @gr)

		@li = List.new()

                @li.Insert_head(@a7)
                @li.Insert_head(@a6)
                @li.Insert_head(@a1)
		@gra = List.new()
		@gra.Insert_head(80.0)
		@gra.Insert_head(10.0)
		@gra.Insert_head(35.0)


                @p_h = Plato_herencia.new("Plato3", @li, @gra)

		@espanola = List.new()

                @espanola.Insert_head(@a15)
                @espanola.Insert_head(@a4)
                @espanola.Insert_head(@a3)
  		@espanola.Insert_head(@a13)
		@gr1 = List.new()
		@gr1.Insert_head(70.0)
		@gr1.Insert_head(20.0)
		@gr1.Insert_head(35.0)
		@gr1.Insert_head(55.0)

                @esp = Plato.new("Espanola", @espanola, @gr1)

		@vasca = List.new()

                @vasca.Insert_head(@a15)
                @vasca.Insert_head(@a3)
                @vasca.Insert_head(@a13)
		@gr2 = List.new()
		@gr2.Insert_head(70.0)
		@gr2.Insert_head(10.0)
		@gr2.Insert_head(45.0)

                @vas = Plato.new("Vasca", @vasca, @gr2)

		@vegetaria = List.new()

                @vegetaria.Insert_head(@a15)
                @vegetaria.Insert_head(@a3)
                @vegetaria.Insert_head(@a13)
		@gr3 = List.new()
		@gr3.Insert_head(70.0)
		@gr3.Insert_head(10.0)
		@gr3.Insert_head(35.0)

                @vegetar = Plato.new("Vegetaria", @vegetaria, @gr3)

		@vegetaliana = List.new()

                @vegetaliana.Insert_head(@a15)
                @vegetaliana.Insert_head(@a9)
                @vegetaliana.Insert_head(@a12)
		@vegetaliana.Insert_head(@a8)
		@gr4 = List.new()
		@gr4.Insert_head(70.0)
		@gr4.Insert_head(10.0)
		@gr4.Insert_head(35.0)
		@gr4.Insert_head(55.0)

                @vegetal = Plato.new("Vegetaliana", @vegetaliana, @gr4)



		@locura = List.new()

                @locura.Insert_head(@a15)
                @locura.Insert_head(@a9)
                @locura.Insert_head(@a12)
		@locura.Insert_head(@a8)
		@gr5 = List.new()
		@gr5.Insert_head(70.0)
		@gr5.Insert_head(10.0)
		@gr5.Insert_head(35.0)
		@gr5.Insert_head(55.0)

                @loc = Plato.new("Locura para el Carne", @locura, @gr5)

		@lista_platos = List.new()
		@lista_platos.Insert_head(@esp)
		@lista_platos.Insert_head(@vas)
		@lista_platos.Insert_head(@vegetar)
		@lista_platos.Insert_head(@vegetal)
		@lista_platos.Insert_head(@loc)

		@pl = List.new()

                #@pl.Insert_head(@a15)
                @pl.Insert_head(@a9)
                #@pl.Insert_head(@a12)
                @pl.Insert_head(@a8)
		@pl.Insert_head(@a1)
		#@pl.Insert_head(@a10)
                @gr6 = List.new()
                @gr6.Insert_head(1000.0)
                @gr6.Insert_head(1200.0)
                @gr6.Insert_head(500.0)
                #@gr6.Insert_head(280.0)
		#@gr6.Insert_head(300.0)
		#@gr6.Insert_head(260.0)

		@gr8 = List.new()
                @gr8.Insert_head(1000.0)
                @gr8.Insert_head(100.0)
                @gr8.Insert_head(500.0)


		@plat4 = Plato_herencia.new("plater", @pl, @gr6)
		@plat2 = Plato_herencia.new("Vasca", @vasca, @gr8)
		@plat = Plato_herencia.new("Plato_nuevo", @espanola, @gr1)
		@gr7 = List.new()
                @gr7.Insert_head(1000.0)
                @gr7.Insert_head(1300.0)
                @gr7.Insert_head(200.0)
		@gr7.Insert_head(1000.0)


		@plat3 = Plato_herencia.new("Vegetaliana", @vegetaliana, @gr7)


		@menu_dietico = [ @plat, @plat2, @plat3, @plat4]
                @precios = [10, 25, 12, 30]


		

                
	end




	context "expectativas de un plato" do
		it "nombre de plato" do
			expect(@p1.name).to eq("Plato1")
		end
		it "metodo de nombre" do
			expect(@p1.Name).to eq("Plato1")
		end
		it "metodo proteinas" do
			expect(@p1.Proteinas).to eq(79.06)
		end
		it "metodo lipidos" do
			expect(@p1.Lipidos).to eq(110.43)
		end
		it "metodo carbohidratos" do
			expect(@p1.Carbohidratos).to eq(29.74)
		end
		it "metodo VCT" do
			expect(@p1.VCT).to eq(219.23)
		end
		it "porcentaje proteinas" do
			expect(@p1.Porcentaje_prot).to eq(36.06)
		end
		it "porcentaje lipidos" do
			expect(@p1.Porcentaje_lip).to eq(50.37)
		end
		it "porcentaje carbohidratos" do
			expect(@p1.Porcentaje_carb).to eq(13.57)
		end
		it "metodo gramos de total de todos alimentos" do
			expect(@p1.Gramos_total).to eq(120.0)
		end
		it "metodo de gramos total de proteinas" do
			expect(@p1.Gramos_prot).to eq(19.77)
		end
		it "metodo de gramos total de lipidos" do
			expect(@p1.Gramos_lip).to eq(12.27)
		end
		it "metodo de gramos total de carbohidratos" do
			expect(@p1.Gramos_carb).to eq(7.44)
		end
		it "metodo de alimentos del plato" do
			expect(@p1.Alimentos).to eq("Huevos, Chocolate, Pollo, ")
		end
		it " metodo to_s" do
			expect(@p1.to_s).to eq("\tPlato: Plato1\nAlimentos: Huevos, Chocolate, Pollo, \nPorcentaje Proteinas: 36.06\nPorcentaje Lipidos: 50.37\nPorcentaje Cerbohidratos: 13.57\nKcal total: 219.23")
		end

	end



	context " Plato clase heredada" do
		it "metodo gei" do
			expect(@plato_herencia.GEI_total).to eq(5.81)
		end
		it "metodo terreno" do
			expect(@plato_herencia.Terreno_total).to eq(7.48)
		end
		it "metodo to_s" do
			expect(@plato_herencia.to_s).to eq("( \tPlato: Plato2\nAlimentos: Huevos, Chocolate, Pollo, \nPorcentaje Proteinas: 36.06\nPorcentaje Lipidos: 50.37\nPorcentaje Cerbohidratos: 13.57\nKcal total: 219.23\nGei Total: 5.81\nTerreno Total: 7.48 )")
		end
	end

	context "Pruebas para comprobar jerarquia" do
		it "comprobar clase de un objeto" do
			expect(@p1).to be_an_instance_of(Plato)
			expect(@plato_herencia).to be_an_instance_of(Plato_herencia)
			
		end
		it  "comprobar tipo de objeto" do
			expect(@p1.respond_to?('Porcentaje_prot')).to eq(true)
			expect(@p1.respond_to?('GEI_total')).to eq(false)
			expect(@plato_herencia.respond_to?('GEI_total')).to eq(true)
			expect(@plato_herenia.respond_to?('VCT')).to eq(false)
		end
		it "jerarquia de clase" do
			expect(@p1.is_a?(BasicObject)).to eq(true)
			expect(@p1.is_a?(Object)).to eq(true)
			expect(@plato_herencia.is_a?(BasicObject)).to eq(true)
			expect(@plato_herencia.is_a?(Object)).to eq(true)



		end
		it "superclass" do
			expect(Plato_herencia.superclass).to eq(Plato)
		end
	end


	context "Comparables para jerarquia de clases" do

		it "mayor" do
			expect(@p_h > @plato_herencia).to eq(false)
		end
		it "menor" do
			expect(@plato_herencia < @p_h).to eq(false)
			expect(@p_h > @plato_herencia).to eq(false)
		end
		it "menor" do
			expect(@plato_herencia < @p_h).to eq(false)
			expect(@p_h < @plato_herencia).to eq(false)
		end
		it "igual" do
			p_h2 = Plato_herencia.new("Plato3", @li, @gra)
			expect(@p_h == p_h2).to eq(true)
		end
#------------------------------------------------------------------------------------------------------------------
#COMPARABLES

	end

	context " Trabajar con platos de cinco dietas" do
		it "mayor" do
			expect(@esp > @vas).to eq(true)
			expect(@vegetal > @loc).to eq(false)
		end
		it "menor" do
			expect(@vegetal < @vegetar).to be(false)
			expect(@loc < @esp).to be(true)
		end
		it "igual" do
			expect(@vegetal == @vegetar).to eq(false)
			expect(@loc == @vas).to be(false)
		end
		it " menos igual" do
			expect(@vegetal <= @esp).to eq(true)
		end
		it "mayor igual" do
			expect(@esp >= @loc).to eq(true)
		end

	end

#----------------------------------------------------------------------------------------------------------------------
#ENUMERABLES

	context "enumerar lista de platos" do
		it "sort" do
			expect(@lista_platos.sort).to eq([@vegetar,@vas,@loc,@vegetal,@esp])
		end
		it "collect" do
			expect(@lista_platos.collect{|i| i.name}).to eq(["Locura para el Carne", "Vegetaliana", "Vegetaria", "Vasca", "Espanola"])
		end
		it " select" do
			expect(@lista_platos.select{ |i| i.Gramos_total.between?(100,165)}).to eq([@vegetar,@vas])
		end
		it "max" do
			expect(@lista_platos.max).to eq(@esp)
		end
		it "min" do
			expect(@lista_platos.min).to eq(@vegetar)
		end
	end

	


####################
#HUELLA NUTRICIONAL
	


	context "Calculos de huella nutricional" do
		#def max(arr)
                 #       return arr.max
                #end

                def precio(arr, i)

                        return arr.map{ |x| x*i }
                end


		it "max" do
			expect(@menu_dietico.max).to eq(@plat4)
		end
=begin
		it " precios" do
			x=@plat4.Huella_nutricional
			puts x
			expect(precio(@precios, @plat4.Huella_nutricional)).to eq([20.0, 50.0, 24.0, 60.0])
		end

=end
		it "new VCT" do
			x = @menu_dietico.collect{ |i| i.new_VCT}

			expect(x).to eq([1.0, 1.7, 2.0, 2.3])

			expect(@plat4.new_VCT).to eq(2.3)
			expect(@plat3.new_VCT).to eq(2)
			expect(@plat2.new_VCT).to eq(1.7)
			expect(@plat.new_VCT).to eq(1)
		end
		it "total VCT" do
			x = @menu_dietico.collect{ |i| i.new_VCT}.reduce(:+)
                        expect(x).to eq(7)
		end

		it " new huella carbono" do
			x = @menu_dietico.collect{ |i| i.new_GEI}

                        expect(x).to eq([1.0, 1.0, 1.0, 1.0])

			expect(@plat4.new_GEI).to eq(1)
			expect(@plat3.new_GEI).to eq(1)
		end
		it "huella nutricional" do
			#y=@plat4.new_Huella_nutricional
			#puts y

			x = @menu_dietico.map{ |i| i.new_Huella_nutricional}

                        expect(x).to eq([1.0, 1.4, 1.5, 1.7])

			expect(@plat4.new_Huella_nutricional).to eq(1.7)
			expect(@plat.new_Huella_nutricional).to eq(1)
			expect(@plat2.new_Huella_nutricional).to eq(1.4)
			expect(@plat3.new_Huella_nutricional).to eq(1.5)
		end
		it "total huella nutricional" do

			x = @menu_dietico.map{ |i| i.new_Huella_nutricional}.reduce(:+)

			expect(x).to eq(5.6)
		end

		it "Precios" do
			expect(precio(@precios, @plat4.new_Huella_nutricional)).to eq([17.0, 42.5, 20.4, 51.0])

		end


	end

	


end






#--------------------------------------------------------------------------------------------------------------------------------------------------------------------
#PRUEBAS CLASE MENU





describe Menu do
        before :all do

		@pollo = Plato_DSL.new("Alitas de Pollo") do
		 	a2 = Alimentos.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
                        component a2,
                        
			:descripcion => a2.name,
                        :gramos => 300,
                        :proteinas => a2.proteina*0.3,
                        :lipidos => a2.lipidos*0.3,
                        :carbo => a2.carbohidratos*0.3,
                        :gei => a2.gei*0.3,
                        :terreno => a2.terreno*0.3
		end




		@menu = Menu.new("Combinado n° 1") do


			@hamburguesa = Plato_DSL.new("Hamburguesa") do
                        	a1 = Alimentos.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
                        	a4 = Alimentos.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)

                        	component a1,
                        	:descripcion => a1.name,
                        	:gramos => 100,
                        	:proteinas => a1.proteina,
                        	:lipidos => a1.lipidos,
                        	:carbo => a1.carbohidratos,
                        	:gei => a1.gei,
                        	:terreno => a1.terreno

                        	component a4,
                        	:descripcion => a4.name,
                        	:gramos => 20,
                        	:proteinas => a4.proteina*0.2,
                        	:lipidos => a4.lipidos*0.2,
                        	:carbo => a4.carbohidratos*0.2,
                        	:gei => a4.gei*0.2,
                        	:terreno => a4.terreno*0.2
                	end


			@cerveza = Plato_DSL.new("Cerveza") do
				 a13 = Alimentos.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
				component a13,
                                :descripcion => a13.name,
                                :gramos => 1000,
                                :proteinas => a13.proteina*10,
                                :lipidos => a13.lipidos*10,
                                :carbo => a13.carbohidratos*10,
                                :gei => a13.gei*10,
                                :terreno => a13.terreno*10
			end

			@pollo = Plato_DSL.new("Alitas de Pollo") do
				a2 = Alimentos.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
				component a2,
                                :descripcion => a2.name,
                                :gramos => 300,
				:proteinas => a2.proteina*0.3,
				:lipidos => a2.lipidos*0.3,
				:carbo => a2.carbohidratos*0.3,
				:gei => a2.gei*0.3,
				:terreno => a2.terreno*0.3
			end


			compo @hamburguesa,
				:descripcion => @hamburguesa.to_s,
				:precio => 4.25

			compo @pollo,
				:descripcion => @pollo.to_s,
				:precio => 2.25

			compo @cerveza,
				:descripcion => @cerveza.to_s,
				:precio => 1.50

			price "Total",
				:price => 4.25+2.25+1.50
		end




	end

	context "menu" do
		it "plato" do
			expect(@pollo.to_s).to eq("\nAlitas de Pollo\n===============\n\n1) Alimento: Pollo\n2) Gramos: 300\n3) Proteinas: 6.180000000000001\n4) Carbohidratos: 0.0\n5) Lipidos: 1.68\n6) GEI: 1.71\n7) Terreno: 2.13\n")
		end

		it " menu" do
			expect(@menu.to_s).to eq("\nCombinado n° 1\n==============\n\n\n\nHamburguesa\n===========\n\n1) Alimento: Carne de cordero\n2) Gramos: 100\n3) Proteinas: 18.0\n4) Carbohidratos: 0.0\n5) Lipidos: 17.0\n6) GEI: 20.0\n7) Terreno: 185.0\n8) Alimento: Huevos\n9) Gramos: 20\n10) Proteinas: 2.6\n11) Carbohidratos: 0.22000000000000003\n12) Lipidos: 2.2\n13) GEI: 0.8400000000000001\n14) Terreno: 1.1400000000000001\n\n\n Precio: $4.25\n\n\nAlitas de Pollo\n===============\n\n1) Alimento: Pollo\n2) Gramos: 300\n3) Proteinas: 6.180000000000001\n4) Carbohidratos: 0.0\n5) Lipidos: 1.68\n6) GEI: 1.71\n7) Terreno: 2.13\n\n\n Precio: $2.25\n\n\nCerveza\n=======\n\n1) Alimento: Cerveza\n2) Gramos: 1000\n3) Proteinas: 5.0\n4) Carbohidratos: 36.0\n5) Lipidos: 0.0\n6) GEI: 2.4\n7) Terreno: 2.2\n\n\n Precio: $1.5\n\nPrecio Total: $8.0\n")
		end

	end


end

