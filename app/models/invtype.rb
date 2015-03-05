class Invtype < ActiveRecord::Base
    belongs_to :account
  
  def self.get_name(invtype)
    self.find(invtype).name
  end
  
end
