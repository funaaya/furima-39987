class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :buys
  # has_many :comments
  validates :name, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  validates :password, format: { with: /\A[!-~]+\z/ , message: 'is invalid' }

  with_options presence: true do
    # 存在すること・確認用を含めて2回入力・6字以上はdeviseのデフォルト実装のため省略
    # 半角英数字（空文字NG）以外の場合には、メッセージを出す
    validates :nickname
    # @含むこと・存在することはdeviseのデフォルト実装のため省略
   
    # 全角ひらがな、全角カタカナ、漢字
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid' }

    # 全角カタカナ
    validates :last_name_kana, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :first_name_kana, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :birthday 
    end
  end        
