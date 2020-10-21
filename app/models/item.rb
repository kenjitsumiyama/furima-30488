class Item < ApplicationRecord
   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :category
   belongs_to_active_hash :condition
   belongs_to_active_hash :shipping
   belongs_to_active_hash :prefecture
   belongs_to_active_hash :scheduled_delivery
   belongs_to :user
   has_one_attached :image

   


  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category
    validates :condition
    validates :prefecture
    validates :scheduled_delivery
    validates :price, format: { with: /\A[0-9]+\z/ } ,numericality: { only_integer: true,

    greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999
      
      }
   end
   
   #ジャンルの選択が「--」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1 } do  
    validates :category_id      
    validates :condition_id
    validates :shipping_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    end

  #ジャンルの選択が「--」の時は保存できないようにする
  # validates :category_id,:condition_id, :shipping_id,:prefecture_id,:scheduled_delivery_id, numericality: { other_than: 1 } 
end
