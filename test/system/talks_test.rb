require "application_system_test_case"

class TalksTest < ApplicationSystemTestCase
  setup do
    @talk = talks(:one)
  end

  test "visiting the index" do
    visit talks_url
    assert_selector "h1", text: "Talks"
  end

  test "creating a Talk" do
    visit talks_url
    click_on "New Talk"

    fill_in "Comments number", with: @talk.comments_number
    fill_in "Dislikes number", with: @talk.dislikes_number
    fill_in "Likes number", with: @talk.likes_number
    fill_in "Photo", with: @talk.photo
    fill_in "Shares number", with: @talk.shares_number
    fill_in "Text", with: @talk.text
    fill_in "Title", with: @talk.title
    fill_in "User", with: @talk.user_id
    click_on "Create Talk"

    assert_text "Talk was successfully created"
    click_on "Back"
  end

  test "updating a Talk" do
    visit talks_url
    click_on "Edit", match: :first

    fill_in "Comments number", with: @talk.comments_number
    fill_in "Dislikes number", with: @talk.dislikes_number
    fill_in "Likes number", with: @talk.likes_number
    fill_in "Photo", with: @talk.photo
    fill_in "Shares number", with: @talk.shares_number
    fill_in "Text", with: @talk.text
    fill_in "Title", with: @talk.title
    fill_in "User", with: @talk.user_id
    click_on "Update Talk"

    assert_text "Talk was successfully updated"
    click_on "Back"
  end

  test "destroying a Talk" do
    visit talks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Talk was successfully destroyed"
  end
end
