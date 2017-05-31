class BodyMassesController < ApplicationController
  before_action :get_body_mass

  def index
  end

  def update
    @body_mass.update(body_mass_params)
    render 'index'
  end

  def show
    redirect_to 'index'
  end

  private
  def get_body_mass
    @body_mass = BodyMass.find_by(user_id: current_user.id)
    if !@body_mass
      @body_mass = BodyMass.default(current_user.id)
    end
  end

  def body_mass_params
    body_params = params.require(:body_mass).permit(:user_id, :mass, :height)
    body_params[:imc] = @body_mass.get_imc(body_params[:mass].to_f, body_params[:height].to_f)
    body_params[:category] = @body_mass.get_category(body_params[:imc])
    body_params
  end
end
