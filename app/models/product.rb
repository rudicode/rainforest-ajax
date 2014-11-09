class Product < ActiveRecord::Base
  validates :description, :name, presence: true
  validates :price_in_cents, numericality: { only_integer: true}

  def price_in_dollars
    dollars = price_in_cents.to_f / 100.0
    dollars = sprintf("$%.2f", dollars)
  end
end
