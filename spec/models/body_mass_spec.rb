require 'rails_helper'

RSpec.describe BodyMass, type: :model do

  let(:bodyMass) {BodyMass.new}

  it "should have the correct IMC" do
    imc = bodyMass.get_imc(55,1.65)
    expect(imc).to eq(20.2)
  end

  it "should have the correct category" do
    category = bodyMass.get_category(20.2)
    expect(category).to eq("Normal (healthy weight)")
  end

  it "should create an instance with the correct default values" do
    default = BodyMass.default(1)
    idDefault = default.id
    expect(default).to eq(BodyMass.find(idDefault))
  end

  it "should validate the mass numericality and precense" do
    should validate_presence_of :mass
    should validate_numericality_of :mass
  end

  it "should validate the height numericality and precense" do
    should validate_presence_of :height
    should validate_numericality_of :height
  end
end
