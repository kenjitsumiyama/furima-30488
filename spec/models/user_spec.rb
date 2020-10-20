require 'rails_helper'

RSpec.describe User, type: :model do
  
    before do
      @user = FactoryBot.build(:user)
      
    end   
  

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが40文字以下で登録できる" do
         @user.nickname = "aaaaaaaa"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "111111aaaa"
        @user.password_confirmation = "111111aaaa"
         expect(@user).to be_valid
      end
      
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
        
      end
      it "@がないとemailは登録できない" do
        @user.email = "kkkgmail.com"
        @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
            another_user = FactoryBot.build(:user)
            another_user.email = @user.email
            another_user.valid?
            expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")

      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it "passwordが半角英数字混合でなければ登録できない(半角英字のみ)" do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it "passwordが半角英数字混合でなければ登録できない(半角数字のみ)" do
        @user.password = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
         @user.password_confirmation = ""
         @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "first_nameが全角（漢字・ひらがな・カタカナでなければは登録できない" do
        @user.first_name = '1111kkk'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters ")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナでなければは登録できない" do
        @user.first_name = '1111kkk'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters ")
      end
      it "last_name_kana,が全角（カタカナでなければ）、登録できない" do
        @user.last_name_kana = 'aa11ああｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
      end
      it "first_name_kana,が全角（カタカナでなければ）、登録できない" do
        @user.first_name_kana = 'aa11ああｱｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      
    end
  end
end