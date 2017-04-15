class Manager < ActiveRecord::Base
  has_many :logs
  validates :zipcode, presence: true
  validates :name, presence: true, uniqueness: true
end
