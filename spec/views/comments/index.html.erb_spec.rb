require 'rails_helper'

RSpec.describe "comments/index", type: :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        body: "MyText",
        user: nil,
        talk: nil,
        parent_id: 2
      ),
      Comment.create!(
        body: "MyText",
        user: nil,
        talk: nil,
        parent_id: 2
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
