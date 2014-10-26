class Task < ActiveRecord::Base
  belongs_to :list

  validates_presence_of :description
  validates_inclusion_of :status, :in => [true, false]
  validates_associated :list
end
