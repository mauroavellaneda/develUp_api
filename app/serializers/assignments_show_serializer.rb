class AssignmentsShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :skills, :budget, :points
end
