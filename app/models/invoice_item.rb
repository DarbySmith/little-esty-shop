class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  has_one :merchant, through: :item
  has_many :bulk_discounts, through: :merchant

  validates :quantity, :unit_price, :status, presence: true

  enum status: { pending: 0, packaged: 1, shipped: 2 }

  def find_discount
    bulk_discounts
      .joins(:invoice_items)
      .where("invoice_items.quantity >= bulk_discounts.quantity_threshold AND invoice_items.id = #{id}")
      .order(percentage: :desc)
      .first
  end

  def has_discount?
    discounts = bulk_discounts
                .joins(:invoice_items)
                .where("invoice_items.quantity >= bulk_discounts.quantity_threshold AND invoice_items.id = #{id}")
    !discounts.empty?
  end
end
