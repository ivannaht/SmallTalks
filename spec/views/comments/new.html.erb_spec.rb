require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      body: "MyText",
      user: nil,
      talk: nil,
      parent_id: 1
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "textarea[name=?]", "comment[body]"

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "input[name=?]", "comment[talk_id]"

      assert_select "input[name=?]", "comment[parent_id]"
    end
  end
end
