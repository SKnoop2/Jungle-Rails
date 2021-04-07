require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
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

  scenario "They can see the product details page" do
    # visit home page
    visit root_path
    #find element on page & click on link
    first('footer.actions').click_link('Details »')
    # ensure item can be found on once page loads
    expect(page).to have_css('article.product-detail')

    # save_screenshot
  end
end


