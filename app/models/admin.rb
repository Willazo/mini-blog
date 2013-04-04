class Admin < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  attr_accessible :email, :name, :surname, :password, :password_confirmation
end
