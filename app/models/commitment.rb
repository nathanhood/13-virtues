class Commitment < ActiveRecord::Base
  belongs_to :user
  belongs_to :virtue

  validates :description, presence: true
end
