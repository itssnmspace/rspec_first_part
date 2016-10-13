class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :name, :description, :user_id, presence: true
end