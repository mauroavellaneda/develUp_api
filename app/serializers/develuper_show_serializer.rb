class DeveluperShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :skills, :points, :level, :completed_projects, :ongoing_assignment
end
