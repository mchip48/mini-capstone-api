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
    return  "You'll pay $#{formatted_tax_result} in taxes"
  end
end
