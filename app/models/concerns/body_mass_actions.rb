module BodyMassActions
  extend ActiveSupport::Concern

  def get_imc(mass=1,height=1)
    @imc = mass / height**2
    @imc.round(2)
    #body_imc = {imc: @imc.round(2)}
  end

  def get_category(imc=0)
    if imc < 15
      @category = 'Very severely underweight'
    elsif imc >= 15 and imc <= 16
      @category = 'Severely underweight'
    elsif imc >= 16 and imc <= 18.5
      @category = 'Underweight'
    elsif imc >= 18.5 and imc <= 25
      @category = 'Normal (healthy weight)'
    elsif imc >= 25 and imc <= 30
      @category = 'Overweight'
    elsif imc >= 30 and imc <= 35
      @category = 'Obese Class I (Moderately obese)'
    elsif imc > 35 and imc <= 40
      @category = 'Obese Class II (Severely obese)'
    else
      @category = 'Obese Class III (Very severely obese)'
    end
    #@category = {category: @category}
  end


  module ClassMethods

    def default(user_id)
      @body_mass = self.create(user_id: user_id) do |u|
        u.mass = 0
        u.height = 0
        u.category = "Unknow"
        u.imc = 0
      end
    end

  end
end
