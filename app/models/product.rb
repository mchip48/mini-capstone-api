class Product < ApplicationRecord
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
  
end
