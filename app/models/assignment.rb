class Assignment < ApplicationRecord
  DEFAULT_SKILLS = ["Javascript",
                    "Ruby",
                    "HTML-CSS",
                    "Node JS",
                    "React",
                    "Angular",
                    "React Native",
                    "Fullstack"]

  validates_intersection_of :skills, in: DEFAULT_SKILLS, message: "Invalid skill"
  enum status: [:published, :ongoing, :closed]

  validates_presence_of :title, :points, :budget, :description, :timeframe, :skills
  belongs_to :client, class_name: "User"

end
