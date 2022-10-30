class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def subtotal #小計
    item.with_tax_price * amount
  end
end
