require "test_helper"

class TalksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @talk = talks(:one)
  end

  test "should get index" do
    get talks_url
    assert_response :success
  end

  test "should get new" do
    get new_talk_url
    assert_response :success
  end

  test "should create talk" do
    assert_difference('Talk.count') do
      post talks_url, params: { talk: { comments_number: @talk.comments_number, dislikes_number: @talk.dislikes_number, likes_number: @talk.likes_number, photo: @talk.photo, shares_number: @talk.shares_number, text: @talk.text, title: @talk.title, user_id: @talk.user_id } }
    end

    assert_redirected_to talk_url(Talk.last)
  end

  test "should show talk" do
    get talk_url(@talk)
    assert_response :success
  end

  test "should get edit" do
    get edit_talk_url(@talk)
    assert_response :success
  end

  test "should update talk" do
    patch talk_url(@talk), params: { talk: { comments_number: @talk.comments_number, dislikes_number: @talk.dislikes_number, likes_number: @talk.likes_number, photo: @talk.photo, shares_number: @talk.shares_number, text: @talk.text, title: @talk.title, user_id: @talk.user_id } }
    assert_redirected_to talk_url(@talk)
  end

  test "should destroy talk" do
    assert_difference('Talk.count', -1) do
      delete talk_url(@talk)
    end

    assert_redirected_to talks_url
  end
end
