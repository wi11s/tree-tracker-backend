require "test_helper"

class UserTreesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_tree = user_trees(:one)
  end

  test "should get index" do
    get user_trees_url, as: :json
    assert_response :success
  end

  test "should create user_tree" do
    assert_difference("UserTree.count") do
      post user_trees_url, params: { user_tree: { common_name: @user_tree.common_name, description: @user_tree.description, health: @user_tree.health, image: @user_tree.image, lat: @user_tree.lat, lng: @user_tree.lng, pet_name: @user_tree.pet_name, scientific_name: @user_tree.scientific_name, user_id: @user_tree.user_id, wiki: @user_tree.wiki } }, as: :json
    end

    assert_response :created
  end

  test "should show user_tree" do
    get user_tree_url(@user_tree), as: :json
    assert_response :success
  end

  test "should update user_tree" do
    patch user_tree_url(@user_tree), params: { user_tree: { common_name: @user_tree.common_name, description: @user_tree.description, health: @user_tree.health, image: @user_tree.image, lat: @user_tree.lat, lng: @user_tree.lng, pet_name: @user_tree.pet_name, scientific_name: @user_tree.scientific_name, user_id: @user_tree.user_id, wiki: @user_tree.wiki } }, as: :json
    assert_response :success
  end

  test "should destroy user_tree" do
    assert_difference("UserTree.count", -1) do
      delete user_tree_url(@user_tree), as: :json
    end

    assert_response :no_content
  end
end
