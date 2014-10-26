class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  validates_presence_of :name
  validates_associated :user
end
