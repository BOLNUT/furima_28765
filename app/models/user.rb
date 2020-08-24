class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 空文字制限(入力必須)
  with_options presence: true do
    validates :nick_name
    validates :email
    validates :password
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :birth_date
  end

  # email 入力制限
  validates :email, uniqueness: true # 一意性制約
  validates :email, presence: true, inclusion: { in: ["@"] } # "@"を含めているかを確認
  
  # password 入力制限
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i # 半角英数字だけを許可する
  validates :password, length: { minimum: 6 } # 6文字以上かを確認
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  # 名前 入力制限
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/ # 全角ひらがな、全角カタカナ、漢字だけを許可する
  with_options format: { with: VALID_NAME_REGEX } do
    validates :family_name 
    validates :first_name
  end
  
  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/ # 全角カナだけを許可する
  with_options format: { with: VALID_KANA_REGEX } do
    validates :family_name_kana 
    validates :first_name_kana
  end
end
