require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "入力フォームの全てがが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "emailに'@'があれば登録できる" do
        @user.nick_name = "aaa@aaa.aaa"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で半角英数であれば登録できる" do
        @user.password = "abcde6"
        @user.password_confirmation = "abcde6"
        expect(@user).to be_valid
      end
    end
  
    context '新規登録がうまくいかないとき' do
      it "nick_nameが空だと登録できない" do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      # email
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください", "Eメールは不正な値です")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      # //email

      # password
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは6文字以上で入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = 'abcd5'
        @user.password_confirmation = 'abcd5'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordは半角英数字混合でないと登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      # //password

      # family_name first_name
      it "family_nameが空だと登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓名を入力してください", "姓名は不正な値です")
      end
      it "family_nameは、全角（漢字・ひらがな・カタカナ）で入力しないと登録できない" do
        @user.family_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓名は不正な値です")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前は不正な値です")
      end
      it "first_nameは、全角（漢字・ひらがな・カタカナ）で入力しないと登録できない" do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("姓名を入力してください", "姓名は不正な値です")
      end
      it "family_name_kanaが全角カナじゃないと登録できない" do
        @user.family_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("姓名は不正な値です")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前は不正な値です")
      end
      it "first_name_kanaが全角カナじゃないと登録できない" do
        @user.first_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      # //family_name first_name

      # birth_date
      it "birth_dateが空だと登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      # //birth_date
    end
  end
end