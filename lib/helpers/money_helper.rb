# frozen_string_literal: true

module MoneyHelper
  def self.price_to_base(price_in_dollars)
    (100 * price_in_dollars.to_r).to_i
  end
end
