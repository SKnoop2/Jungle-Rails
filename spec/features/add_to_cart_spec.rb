require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Add item to cart" do
    # visit home page
    visit root_path
    # expect cart to have 0 items in it
    expect(page).to have_link('My Cart (0)')
    # click add to cart
    first('footer.actions').click_button('Add')
    # expect cart to have 1 item in it
    expect(page).to have_link('My Cart (1)')
  end

end
