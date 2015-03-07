class Future < ActiveRecord::Base
  belongs_to :account
  has_many :future_line_items
  validates :account_id, :presence => true
  
    WEEKS = ["1", "2", "3","4","5","6","7","8","9","10"]
  
  def self.get_value(future)
    getval = FutureLineItem.where(:future_id => future).sort_by { |h| h[:year]}.reverse.first.ammount
        
  end
  
end
