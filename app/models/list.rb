class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  validates_presence_of :name
  validates_associated :user

  def self.get_lists(user)
    List.where(user: user).eager_load(:tasks)
  end
end
