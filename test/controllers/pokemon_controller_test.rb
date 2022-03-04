require "test_helper"

class PokemonControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get pokemon_test_url
    assert_response :success
  end
end
