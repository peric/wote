class Vote < ActiveRecord::Base
  belongs_to :website
  belongs_to :user
  validates :website, :user, :presence => true
end
