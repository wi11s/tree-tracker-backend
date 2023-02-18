require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request = requests(:one)
  end

  test "should get index" do
    get requests_url, as: :json
    assert_response :success
  end

  test "should create request" do
    assert_difference("Request.count") do
      post requests_url, params: { request: { receiver_id: @request.receiver_id, sender_id: @request.sender_id } }, as: :json
    end

    assert_response :created
  end

  test "should show request" do
    get request_url(@request), as: :json
    assert_response :success
  end

  test "should update request" do
    patch request_url(@request), params: { request: { receiver_id: @request.receiver_id, sender_id: @request.sender_id } }, as: :json
    assert_response :success
  end

  test "should destroy request" do
    assert_difference("Request.count", -1) do
      delete request_url(@request), as: :json
    end

    assert_response :no_content
  end
end
