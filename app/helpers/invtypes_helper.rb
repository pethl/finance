module InvtypesHelper
  
  def self.get_name(id)
    Invtype.where(:id => id).first.name
  end
end
