class Api::V1::PokemonsController < ApplicationController
  def pokemon
    begin
      request_poke_api = PokeApi.get(pokemon: params[:pokemon])
      parsed_response = PokemonsServices::ParsedPokemon.call(request_poke_api)
      render json: parsed_response, status: :ok
    rescue => exception
      render json: {message: exception.message}, status: :not_found
    end
  end
end