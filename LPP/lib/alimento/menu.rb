
class Plato_DSL

	attr_accessor :name, :componente

	def initialize(name, &block)
		@name=name
		@componente = []

		if block_given?
                        if block.arity == 1
                                yield self
                        else
                                instance_eval(&block)
                        end
                end
        end

	def Name
		@name
	end

	def component(alimento, options = {})
		description=""
		gramos = ""
		prot =""
		carbo=""
		lip=""
		gei=""
		ter=""
=begin
		x = gram.to_f/100.0
		
		

		description = alimento.name
                gramos = gram
		prot = alimento.proteina*x
		carbo = alimento.carbohidratos*x
		lip = alimento.lipidos*x
		gei = alimento.gei*x
		ter = alimento.terreno*x
=end

                description << "Alimento: #{options[:descripcion]}" if options[:descripcion]

                gramos <<  "Gramos: #{options[:gramos]}" if options[:gramos]

		prot << "Proteinas: #{options[:proteinas]}" if options[:proteinas]
		carbo << "Carbohidratos: #{options[:carbo]}" if options[:carbo]

		lip << "Lipidos: #{options[:lipidos]}" if options[:lipidos]

		gei << "GEI: #{options[:gei]}" if options[:gei]

		ter << "Terreno: #{options[:terreno]}" if options[:terreno]

                @componente << description
                @componente << gramos
		@componente << prot
		@componente << carbo
		@componente << lip
		@componente << gei
		@componente << ter

        end


	def to_s


		output = ""
		
		output << "\n#{@name}\n"
		output << "#{'=' * @name.size}\n\n"

		@componente.each_with_index do |comp, i|
      			output << "#{i + 1}) #{comp}\n"
		end

#		puts output 

		output
    
	end


end





class Menu


	attr_accessor :name, :componente, :tot

	def initialize(name, &block)
		@name=name
		@componente = []
		@tot = ""
		

		if block_given?
     		 	if block.arity == 1
        			yield self
      			else
       				instance_eval(&block)
      			end
    		end
  	end

	def to_s

		output = ""

                output << "\n#{@name}\n"
	

		output << "#{'=' * @name.size}\n\n"
		

		@componente.each_with_index do |comp, i|
                        output << "\n#{comp}\n"
		end

		output << "\n#{@tot}\n"

		puts output

		output

	end

	def compo(name, options = {})

		des =""
		precio =""

		des << "#{options[:descripcion]}" if options[:descripcion]
		precio << " Precio: $#{options[:precio]}" if options[:precio]

		@componente << des
		@componente << precio



	end

	def price(x, options = {})
		

		@tot << "Precio Total: $#{options[:price]}" if options[:price]
	end

end


