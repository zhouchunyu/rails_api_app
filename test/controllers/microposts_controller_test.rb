require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @micropost = microposts(:one)
    @user = users(:one)
  end

  test "should get index" do
    get microposts_url,
        headers: {'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(@user.authentication_token, email: @user.email)},
        as: :json
    assert_response :success
  end

  test "should search" do
    post search_microposts_url,
         params: {q: {content_cont: 'hello'}},
         headers: {'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials(@user.authentication_token, email: @user.email)},
         as: :json
    assert_response :success
  end

  test "should create micropost" do
    assert_difference('Micropost.count') do
      post microposts_url, params: { micropost: { content: @micropost.content, user_id: @micropost.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show micropost" do
    get micropost_url(@micropost), as: :json
    assert_response :success
  end

  test "should update micropost" do
    patch micropost_url(@micropost), params: { micropost: { content: @micropost.content, user_id: @micropost.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy micropost" do
    assert_difference('Micropost.count', -1) do
      delete micropost_url(@micropost), as: :json
    end

    assert_response 204
  end
end
