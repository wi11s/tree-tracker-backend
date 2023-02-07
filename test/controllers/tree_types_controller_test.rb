require "test_helper"

class TreeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tree_type = tree_types(:one)
  end

  test "should get index" do
    get tree_types_url, as: :json
    assert_response :success
  end

  test "should create tree_type" do
    assert_difference("TreeType.count") do
      post tree_types_url, params: { tree_type: { common_name: @tree_type.common_name, frequency: @tree_type.frequency, image: @tree_type.image } }, as: :json
    end

    assert_response :created
  end

  test "should show tree_type" do
    get tree_type_url(@tree_type), as: :json
    assert_response :success
  end

  test "should update tree_type" do
    patch tree_type_url(@tree_type), params: { tree_type: { common_name: @tree_type.common_name, frequency: @tree_type.frequency, image: @tree_type.image } }, as: :json
    assert_response :success
  end

  test "should destroy tree_type" do
    assert_difference("TreeType.count", -1) do
      delete tree_type_url(@tree_type), as: :json
    end

    assert_response :no_content
  end
end
