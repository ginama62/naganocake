class Address < ApplicationRecord
  belongs_to :customer

  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end

#   def change
#     create_table :addresses do |t|
#       t.integer :customer_id, null: false
#       t.string :name, null: false
#       t.string :postal_code, null: false
#       t.string :address, null: false

#       t.timestamps
#     end
#   end
# end
  