class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password,:password_confirmation, length: {minimum:6}, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/ }
  validates :last_name, presence: true, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}
  validates :first_name, presence: true, format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}
  validates :last_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :birthday, presence: true
end
