class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications
  has_many :applications, through: :pet_applications
  validates_presence_of :name, :description, :approximate_age, :sex

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }

  enum sex: [:female, :male]

  # def find_by_name(search)
  #   self.find_all do |pet|
  #     pet.name == search
  #   end
  # end

  def self.find_by_name(search)
    upcased = search.upcase
    where(name.upcase.include? "#{upcased}")
  end

end
