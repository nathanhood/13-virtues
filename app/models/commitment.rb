class Commitment < ActiveRecord::Base
  belongs_to :user
  belongs_to :virtue

  validates_presence_of :user, :virtue, :description
end
