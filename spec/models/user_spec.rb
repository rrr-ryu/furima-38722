require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    context "新規登録できる場合" do

      it "nickname.email.password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在する時" do
        expect(@user).to be_valid  
      end
    end

    context "新規登録できない場合" do

      it "nicknameが存在しない時" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank" 
      end

      it "emailが存在しない時" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank" 
      end

      it "emailが重複している時" do
        @another_user = FactoryBot.create(:user)
        @user.email = @another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include "Email has already been taken" 
      end
      
      it "emailに@が含まれない時" do
        @user.email = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid" 
      end

      it "passwordが存在しない時" do
        @user.password = ""
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank" 
      end

      it "passwordに半角英数字混合していない時" do
        @user.password = "123456"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers" 
      end

      it "passwordが5文字以下の時" do
        @user.password = "abc12"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)" 
      end
      
      it "passwordが129文字以上の時" do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too long (maximum is 128 characters)"
      end
      
      it "passwordとpssword_confirmationが一致しない時" do
        @user.password= "abc12345"
        @user.password_confirmation = "abc1234"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password" 
      end
      
      it "last_nameが存在しない時" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank" 
      end
      
      it "last_nameに半角文字が入っている時" do
        @user.last_name = "ﾄﾐｵｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters"
      end

      it "first_nameが存在しない時" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank" 
      end

      it "first_nameに半角文字が入っている時" do
        @user.first_name = "ｷﾞﾕｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters"
      end
      
      it "last_name_kanaが存在しない時" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank" 
      end

      it "last_name_kanaにひらがなが入っている時" do
        @user.last_name_kana = "とみおか"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters" 
      end

      it "last_name_kanaに漢字が入っている時" do
        @user.last_name_kana = "冨岡"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters" 
      end
      
      it "last_name_kanaに半角文字が入っている時" do
        @user.last_name_kana = "ﾄﾐｵｶ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters" 
      end
      
      it "first_name_kanaが存在しない時" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank" 
      end

      it "first_name_kanaにひらがなが入っている時" do
        @user.first_name_kana = "ぎゆう"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters" 
      end

      it "first_name_kanaに漢字が入っている時" do
        @user.first_name_kana = "義勇"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters" 
      end
      
      it "first_name_kanaに半角文字が入っている時" do
        @user.first_name_kana = "ｷﾞﾕｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters" 
      end
      it "birthdayが存在しない時" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank" 
      end
      
    end
    
  end
  
end
