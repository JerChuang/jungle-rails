class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create do |order|
    order.line_items.each do |entry|
    entry.product.quantity = entry.product.quantity - entry.quantity
    entry.product.save
    end
  end

end
