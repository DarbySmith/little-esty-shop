class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items
  has_many :bulk_discounts, through: :merchants
  validates :status, presence: true

  enum status: { 'in progress' => 0, completed: 1, cancelled: 2 }

  def all_revenue
    invoice_items.sum('unit_price * quantity')
  end

  def total_revenue(merchant)
    invoice_items
      .joins(item: :merchant)
      .where("items.merchant_id = #{merchant.id}")
      .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def self.incomplete_invoices
    joins(:invoice_items)
      .where('invoice_items.status=0 OR invoice_items.status=1')
      .order(:created_at)
  end

  def merchant_invoice_items_discount(merchant)
    invoice_items
      .joins(item: { merchant: :bulk_discounts })
      .where("invoice_items.quantity >= bulk_discounts.quantity_threshold AND items.merchant_id = #{merchant.id}")
      .sum('invoice_items.quantity * invoice_items.unit_price * (bulk_discounts.percentage / 100)')
  end

  def revenue_with_discount(merchant)
    total_revenue(merchant) - merchant_invoice_items_discount(merchant)
  end

  def invoice_items_discount
    invoice_items
      .joins(item: { merchant: :bulk_discounts })
      .where('invoice_items.quantity >= bulk_discounts.quantity_threshold')
      .sum('invoice_items.quantity * invoice_items.unit_price * (bulk_discounts.percentage / 100)')
  end

  def all_merchants_discounts_revenue
    all_revenue - invoice_items_discount
  end
end
