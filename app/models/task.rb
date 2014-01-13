class Task < ActiveRecord::Base
  belongs_to :user
  validates :name, :comments, presence: true
end
