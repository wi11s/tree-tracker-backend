require "test_helper"

class JoinTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_type = join_types(:one)
  end

  test "should get index" do
    get join_types_url, as: :json
    assert_response :success
  end

  test "should create join_type" do
    assert_difference("JoinType.count") do
      post join_types_url, params: { join_type: { tree_type_id: @join_type.tree_type_id, user_id: @join_type.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show join_type" do
    get join_type_url(@join_type), as: :json
    assert_response :success
  end

  test "should update join_type" do
    patch join_type_url(@join_type), params: { join_type: { tree_type_id: @join_type.tree_type_id, user_id: @join_type.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy join_type" do
    assert_difference("JoinType.count", -1) do
      delete join_type_url(@join_type), as: :json
    end

    assert_response :no_content
  end
end
