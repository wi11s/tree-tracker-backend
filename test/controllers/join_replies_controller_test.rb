require "test_helper"

class JoinRepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_reply = join_replies(:one)
  end

  test "should get index" do
    get join_replies_url, as: :json
    assert_response :success
  end

  test "should create join_reply" do
    assert_difference("JoinReply.count") do
      post join_replies_url, params: { join_reply: { child_reply_id: @join_reply.child_reply_id, parent_reply_id: @join_reply.parent_reply_id } }, as: :json
    end

    assert_response :created
  end

  test "should show join_reply" do
    get join_reply_url(@join_reply), as: :json
    assert_response :success
  end

  test "should update join_reply" do
    patch join_reply_url(@join_reply), params: { join_reply: { child_reply_id: @join_reply.child_reply_id, parent_reply_id: @join_reply.parent_reply_id } }, as: :json
    assert_response :success
  end

  test "should destroy join_reply" do
    assert_difference("JoinReply.count", -1) do
      delete join_reply_url(@join_reply), as: :json
    end

    assert_response :no_content
  end
end
