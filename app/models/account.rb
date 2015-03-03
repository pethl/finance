class Account < ActiveRecord::Base
  validates :name, presence: true
  validates :status, presence: true
  
  STATUS = ["Open", "Closed"]
end
