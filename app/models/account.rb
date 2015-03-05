class Account < ActiveRecord::Base
  validates :name, presence: true
  validates :status, presence: true
  has_one :invtype
  
  STATUS = ["Open", "Closed"]
  
  def self.get_name(account)
    self.find(account).name
  end
  
end
