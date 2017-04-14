class Manager < ActiveRecord::Base
  validates :zipcode, presence: true
  validates :name, presence: true, uniqueness: true
end
