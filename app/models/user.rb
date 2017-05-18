class User < ApplicationRecord
# Constants
  ROLES = {:full_access => 0, :restricted_access => 1}

  # Enums
  enum role: ROLES

  # Scopes
  scope :with_full_access, -> { where(role: ROLES[:full_access]) }
  scope :with_restricted_access, -> { where(role: ROLES[:restricted_access]) }
  
  #def self.with_full_access
  #  where(role: 'full_access')
  #end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  
end