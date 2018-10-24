class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :social_profiles, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :entries, dependent: :destroy

  def email_required?
    !email.blank? && super
    # (authentications.empty? || !email.blank?) && super
  end

  def social_profiles(provider)
    social_profiles.select{ |sp| sp.provider == provider.to_s}.first
  end
end