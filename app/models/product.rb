class Product < ApplicationRecord

  validates :price, numericality: { greater_than: 0 }

  validate :name_and_inventory_presence

  def is_discounted?
    if price <= 10
      true
    else
      false
    end
  end

  def tax
    tax_result = price * 0.09
    formatted_tax_result = sprintf("%.2f", tax_result)
    return formatted_tax_result.to_i
  end

  def total
    total_price = price + tax.to_i
    return sprintf('%.2f', total_price).to_i
  end

  def friendly_created_at
    created_at.strftime("%b %e, %l:%M %p")
  end

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end

  private

  def name_and_inventory_presence
    if name.blank? && inventory.blank?
      errors.add(:base, "name and inventory must be present")
    end
  end
  
end
