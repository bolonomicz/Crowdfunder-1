class Project < ActiveRecord::Base
	belongs_to :user
  attr_accessible :description, :goal, :teaser, :title

 	validates :title, presence: true, length: {maximum: 100}
 	validates :teaser, presence: true, length: {maximum: 255}
 	validates :description, presence: true
 	validates :goal, presence: true, numericality: {greater_than: 0, allow_blank: true}

 	has_many :pledges
 	has_many :users, through: :pledges
 	has_many :images, dependent: :destroy
 	has_many :supporters, :through => :pledges, :source => :user


 	paginates_per 9

 	 def raised
    self.pledges.sum(:amount)
  end

  def percent_raised
    ((raised.to_f / goal) * 100).to_i
  end

  def succeeded?
    percent_raised >= 100
  end

  def surpassed_goal?
    percent_raised > 100
  end

  def number_of_supporters
    self.supporters.uniq.count
	end
end

