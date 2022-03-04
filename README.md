# ZRP-Pokeapi

Intermediate API for PokeApi consumption

## Get /pokemons/:pokemon_name

Returns a list of abilitys for a given pokemon sorted by ability name

### Documentation

          Name      |               Description                         |     Type
      
      pokemon_name  |            Returns Pokemon Name                   |    String
      abilities     |            Returns All Pokemon abilities          |  Array of Hashes
        name        |            Returns Pokemon ability Name           |    String
        flavor_text |            Returns Pokemon ability flavor text    |    String
        effect      |            Returns Pokemon ability effect         |    String

### Response exemple
```ruby
{
  "pokemon_name": "Ditto",
  "abilities": [
    {
      "name": "Imposter",
      "flavor_text": "Adopte l’apparence du\nPokémon adverse.",
      "effect": "This Pokémon transforms into a random opponent upon entering battle.  This effect is identical to the move transform."
    },
    {
      "name": "Limber",
      "flavor_text": "Prevents paralysis.",
      "effect": "This Pokémon cannot be paralyzed.\n\nIf a Pokémon is paralyzed and acquires this ability, its paralysis is healed; this includes when regaining a lost ability upon leaving battle."
    }
  ]
}```
