require 'test_helper'

class PokemonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pokemon_index_url
    assert_response :success
  end

  test "should get show" do
    get pokemon_show_url
    assert_response :success
  end

  test "should get new" do
    get pokemon_new_url
    assert_response :success
  end

  test "should get create" do
    get pokemon_create_url
    assert_response :success
  end

  test "should get edit" do
    get pokemon_edit_url
    assert_response :success
  end

  test "should get update" do
    get pokemon_update_url
    assert_response :success
  end

  test "should get destroy" do
    get pokemon_destroy_url
    assert_response :success
  end

end
