require 'rails_helper'

RSpec.describe "comments/edit", type: :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      body: "MyText",
      user: nil,
      talk: nil,
      parent_id: 1
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "textarea[name=?]", "comment[body]"

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "input[name=?]", "comment[talk_id]"

      assert_select "input[name=?]", "comment[parent_id]"
    end
  end
end
