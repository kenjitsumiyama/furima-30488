class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers' 
         
         validates :nickname,presence: true

         with_options presence: true, format: {  with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters '
         } do                                    # 全角ひらがな、全角カタカナ、漢字
         validates :first_name                 
         validates :last_name
         end

         with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters'} do
                                                 # 全角カタカナ
         validates :first_name_kana
         validates :last_name_kana
         end

         validates :birth_date,presence: true

end

# 半角英数字混合
# VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
# validates :password, format: { with: VALID_PASSWORD_REGEX }


# PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
# validates_format_of :password, with: PASSWORD_REGEX, message: 


#  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
  # validates :password, presence: true,
            # format: { with: VALID_PASSWORD_REGEX,
            #  message: "は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}


# /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,}$/

