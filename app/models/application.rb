class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  # def list_pets_on_application
  #   pets.map do |pet|
  #     pet.name
  #   end
  # end

end
