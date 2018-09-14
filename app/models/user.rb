class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :social_profiles, dependent: :destroy
  has_and_belongs_to_many :recruitments
  
  def social_profiles(provider)
    social_profiles.select{ |sp| sp.provider == provider.to_s}.first
  end
end