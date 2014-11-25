class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  validates :description, :name, presence: true
  validates :price_in_cents, numericality: { only_integer: true}

  before_validation :titleize_title

  def price_in_dollars
    dollars = price_in_cents.to_f / 100.0
    sprintf("$%.2f", dollars)
  end

  # need to fix this so that it is available in the controller.
  def self.find_in_name_and_description(query,page)
    Product.where("LOWER(name) LIKE LOWER(?) or LOWER(description) LIKE LOWER(?)", "%#{query}%","%#{query}%").order(created_at: :desc).page(page)
  end


  private
  
  def titleize_title
    self.name = name.titleize
  end
end
