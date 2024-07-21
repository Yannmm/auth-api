class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  self.skip_session_storage = [:params_auth, :token_auth]

  has_many :companies

  ROLES = %W[super_admin admin manager]

  ROLES.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end

  def jwt_payload
    super
  end
end
