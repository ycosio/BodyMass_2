require 'rails_helper'

RSpec.describe BodyMass, :type => :feature do

  let(:user) { create(:user) }

  before(:each) do
    login(user)
  end

  it "signs me in" do
    visit '/'
    within("#edit_body_mass_1") do
      fill_in 'Mass', with: '30'
      fill_in 'Height', with: '3'
    end
    click_button 'Update Body mass'
    expect(page).to have_content 'IMC: 3.33'
    expect(page).to have_content 'Category: Very severely underweighti'
  end

end
