require 'rails_helper'

RSpec.describe "additions/show", type: :view do
  before(:each) do
    @addition = assign(:addition, Addition.create!(
      :booking_id => 1,
      :extra_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end