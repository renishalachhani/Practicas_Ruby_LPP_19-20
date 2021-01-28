require './lib/huella'
require 'test/unit'

class TestPoint < Test::Unit::TestCase

	def setup
		@hamburguesa = [1335, 2.9, 11, 9, 4160, 1470, 1070.53, 4.51]
                @lasana = [550, 3.0, 7.1, 8.6, 2170, 660, 361.63, 0.81]
	end


        def test_indicadores_salud

		assert_equal(1335, @hamburguesa[0])
		assert_equal(2.9, @hamburguesa[1])
		assert_equal(11, @hamburguesa[2])
		assert_equal(9, @hamburguesa[3])
	end

        def test_indicadores_ambiental

		assert_equal(4160, @hamburguesa[4])
		assert_equal(1470, @hamburguesa[5])
		assert_equal(1070.53, @hamburguesa[6])
		assert_equal(4.51, @hamburguesa[7])
	end

        def test_energia

		assert_equal(3, Energia(@hamburguesa[0]))
                assert_equal(1, Energia(@lasana[0]))
        end


	def test_sal

		assert_equal(2, Sal(@hamburguesa[1]))
		assert_equal(2, Sal(@lasana[1]))
        end


	def test_ags

		assert_equal(3, AGS(@hamburguesa[2]))
		assert_equal(2, AGS(@lasana[2]))
        end


	def test_fibra

		assert_equal(1, Fibra(@hamburguesa[3]))
		assert_equal(1, Fibra(@lasana[3]))

        end


	def test_Huella_material

		assert_equal(3, Huella_material(@hamburguesa[4]))
		assert_equal(1, Huella_material(@lasana[4]))

        end

	def test_Huella_carbono

		assert_equal(3, Huella_carbono(@hamburguesa[5]))
		assert_equal(1, Huella_carbono(@lasana[5]))

        end

        def test_Huella_hidrica

		assert_equal(3, Huella_hidrica(@hamburguesa[6]))
		assert_equal(1, Huella_hidrica(@lasana[6]))

        end


	def test_terreno

		assert_equal(3, Terreno(@hamburguesa[7]))
		assert_equal(1, Terreno(@lasana[7]))

        end


	def test_huella_nutricional_salud

		assert_equal(2.25, Huella_Nutricional_Salud(@hamburguesa[0], @hamburguesa[1], @hamburguesa[2], @hamburguesa[3]))
                assert_equal(1.5, Huella_Nutricional_Salud(@lasana[0], @lasana[1], @lasana[2], @lasana[3]))

        end


	def test_huella_nutricional_ambiental


		assert_equal(3.00, Huella_Nutricional_Ambiental(@hamburguesa[4], @hamburguesa[5], @hamburguesa[6], @hamburguesa[7]))
                assert_equal(1.00, Huella_Nutricional_Ambiental(@lasana[4], @lasana[5], @lasana[6], @lasana[7]))

        end


	def test_huella_nutricional


		assert_equal(2.63, Huella_Nutricional(@hamburguesa[0], @hamburguesa[1], @hamburguesa[2], @hamburguesa[3], @hamburguesa[4], @hamburguesa[5], @hamburguesa[6], @hamburguesa[7]))


                assert_equal(1.25, Huella_Nutricional(@lasana[0], @lasana[1], @lasana[2], @lasana[3], @lasana[4], @lasana[5], @lasana[6], @lasana[7]))
	end

end
