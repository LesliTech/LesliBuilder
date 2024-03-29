require 'rails_helper'

RSpec.describe "welcomes/index", type: :view do
  before(:each) do
    assign(:welcomes, [
      Welcome.create!(),
      Welcome.create!()
    ])
  end

  it "renders a list of welcomes" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
