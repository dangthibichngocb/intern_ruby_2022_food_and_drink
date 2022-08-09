class Category < ApplicationRecord
  enum status: {active: 0, archived: 1}
  ATTR_CATE = %i(name).freeze
  has_many :products, dependent: :destroy

  validates :name, presence: true
end
