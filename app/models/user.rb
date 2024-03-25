class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :role_name
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :projects
         has_many :message, dependent: :destroy
         has_many :attaches, dependent: :destroy

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
end
