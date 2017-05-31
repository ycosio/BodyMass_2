class BodyMass < ActiveRecord::Base
  include BodyMassActions
  belongs_to :user
  validates :mass, presence: true, numericality: true
  validates :height, presence: true, numericality: true
end
