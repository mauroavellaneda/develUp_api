class AssignmentsShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :skills, :budget, :points, :applicants, :selected, :status
end

def applicants
  applicants = User.where(user_id: applicants)
end

def selected
  selected = User.where(user_id: selected)
  selected = [{ id: selected.id, email: selected.email }]
end
