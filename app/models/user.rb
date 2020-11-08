# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates_presence_of :company_name, :company_url, if: :client?
  validates_presence_of :name, :skills, :level, :points, :completed_projects, if: :develuper?

  validates_presence_of :role

  enum role: [:client, :develuper]
  has_many :assignments, foreign_key: "client_id", class_name: "Assignment"

  private

  def develuper?
    role == "develuper"
  end

  def client?
    role == "client"
  end
end
