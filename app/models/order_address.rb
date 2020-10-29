class OrderAddress
   include ActiveModel::Model
   attr_accessor :user_id,:item_id,:order_id,:postal_code,:city,:address,:building,:prefecture_id,
                 :phone_number,:order_id,:token

   with_options presence: true do
    validates         :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates         :city
    validates         :address  
    validates         :phone_number, format:{with: /\A\d{11}\z/ }
    validates         :token
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates         :prefecture_id
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id,
      city: city, phone_number: phone_number,address: address, 
      building: building,order_id: order.id)
      # 各テーブルにデータを保存する処理を書く
  end
end