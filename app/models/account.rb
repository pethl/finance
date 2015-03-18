class Account < ActiveRecord::Base
  validates :name, presence: true
  validates :status, presence: true
  has_one :invtype
  has_many :futures
  
  STATUS_TYPES = ["Open", "Closed"]
  
  
  def self.get_name(account)
    self.find(account).name
  end
  
  def self.get_share_price(ticker)
    if ticker.blank?
    return 
  else
    gdp = Quandl::Dataset.get(ticker).start('2015-03-04')
    gdp.data[0][1]
  end
  end
  
  def self.get_share_count(account)
     self.find(account).share_count
  end

  
  
end
