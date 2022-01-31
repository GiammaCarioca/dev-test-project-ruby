# frozen_string_literal: true

module ApplicationHelper
  def price_to_dollars(price_in_cents)
    (price_in_cents / 100).to_f
  end

  def gross_income(purchases, offset = 0)
    gross_income ||= purchases.offset(offset).reduce(0) do |sum, purchase|
      item = Product.find(purchase.product_id.to_i)
      sum + (item.base_price * purchase.quantity)
    end

    price_to_dollars(gross_income)
  end
end
