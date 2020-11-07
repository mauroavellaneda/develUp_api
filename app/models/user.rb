# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  # validates_presence_of :role, :company_name, :company_url, if: :selected_role?

  with_options :if => lambda { |user| user.role == "develuper" } do |develuper|
    develuper.validates_presence_of :name
    develuper.validates_presence_of :email
    develuper.validates_presence_of :skills
    develuper.validates_presence_of :points
    develuper.validates_presence_of :level
    develuper.validates_presence_of :completed_projects
  end

  with_options :if => lambda { |user| user.role == "client" } do |client|
    client.validates_presence_of :company_name
    client.validates_presence_of :company_url
  end

  enum role: [:client, :develuper]
  has_many :assignments, foreign_key: "client_id", class_name: "Assignment"
end
