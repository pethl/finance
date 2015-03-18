class Ammount < ActiveRecord::Base
  validates :date, presence: true
  validates :account_id, presence: true
  
end
