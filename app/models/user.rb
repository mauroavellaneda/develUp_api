# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates_presence_of :role, :company_name, :company_url
  enum role: [:client]
  has_many :assignments, foreign_key: "client_id", class_name: "Assignment"
end
