class PokemonsServices::ParsedPokemon < ZrpServices
    def initialize(pokemon)
        @pokemon = pokemon
    end
    
    # Metodo Chamado pelo controller funciona em cascata
    def call
        pokemon_builder
    end
    
    private

    # Contrutor da Response
    # Retorna o Nome do Pokemon e suas Habilitades sortidas pelo nome.
    def pokemon_builder
        {
            pokemon_name: @pokemon.name.capitalize,
            abilities: self.sort_by_ability
        }
    end

    # Metodo para sortir o itens do array em ordem de acordo com o nome das habilidades
    def sort_by_ability
        self.abilities_builder.sort_by! {|item| item[:name]}
    end

    # Metodo contrutor do array de hashs das habilidades.
    # Cada Hash retorna o Nome, Texto Ilustrativo e a descricao do efeito
    def abilities_builder
        @pokemon.abilities.map do |item|
            description = description_builder(item)
            { 
                name: item.ability.name.capitalize,
                flavor_text: description[:flavor_text],
                effect: description[:effect]
            }
        end
    end

    # Metodo que faz a requisicao Pokeapi para recuperar as informacoes extras sobre as habilidades.
    def description_builder(item)
        #Seleciona o ID da habilidade na url por meio de regex
        ability_id = item.ability.url.match(/(?<!v)\d+/)
        ability = PokeApi.get(ability: ability_id)

        {
            flavor_text: ability.flavor_text_entries.first.flavor_text,
            effect: english_effect_entries(ability)
        }
    end

    # Metodo Filtra apenas o efeito em ingles
    def english_effect_entries(ability)
        effect = ability.effect_entries.select {|item| item.language.name == "en"}
        effect.first.effect
    end
end