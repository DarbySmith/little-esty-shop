class Transaction < ApplicationRecord
  belongs_to :invoice
  has_one :merchant, through: :invoice

  validates :credit_card_number, :result, presence: true

  enum result: { success: 0, failed: 1 }
end
