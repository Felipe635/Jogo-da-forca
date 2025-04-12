class Hangman
    def initialize
        element = choose_word
        @lives = 7
        @word = element[0]
        @preview = element[1]
        @space = config_space
       
    end

    
    def choose_word 
        word_list = [
        ["melancia", "Fruta"],
        ["apontador", "Material escolar"],
        ["marrocos", "País"],
        ["advogado", "Profissão"],
        ["cabelo", "Parte do corpo humano"]
    ]

    array = word_list.shuffle[0] #array é embaralhado e retorna o elemento da primeira posição
    
    end

    def config_space
        s = []
        cont = 0
        while cont < @word.size do
            s.push('_')
            cont = cont + 1
        end
        return s
    end

    def space_state
        @space.each do |item|
            print item
         end #imprimir o array com os espaços da palavra
         puts "\n"
    end

    def letter
        puts "Digite uma letra:"
        letter = gets.chomp
    end

    def size_letter
    end

    def live_remaining
        puts "Restam #{@lives} vidas."
    end

    def update_space
        letra = letter
        if @word.include?(letra)
         cont = 0
            for item in @word.split("")
                if letra == item
                    @space[cont] = letra
                end
         cont = cont + 1
            end
        else
            @lives = @lives - 1
        end
    end

    def won?
        
        string = @space.join("")

        if string == @word
            return true
          else
            return false
          end
    end

    def begin
        puts "Bem vindo ao jogo da forca!"
        
        loop do
            puts "A dica da palavra é: #{@preview}"
            
            space_state
            update_space
            live_remaining

            if @lives == 0 && won? == false
                puts "Você perdeu. A palavra era #{@word}. Tente novamente!"
                break
            elsif won? == true
                puts "Parabéns! Você ganhou, a palavra é #{@word}."
                break
            end
        end
    end

end