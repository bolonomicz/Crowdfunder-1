class Pledge < ActiveRecord::Base
  attr_accessible :amount, :project, :user_id

  validates :amount, numericality: { only_integer: true, greater_than: 0}
  validates_presence_of :user, :project

  belongs_to :user
  belongs_to :project
end
