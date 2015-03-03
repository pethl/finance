module ApplicationHelper
  
  def get_invtype_name(id)
    Invtype.where(:id => id).first.name
  end
  
  # count how many ammount records have been recorded for specified account
  def ammounts_count(account_id)
    Ammount.where(:account_id => account_id).count
  end
  
  # get the ammount records for an account sorted by reverse date, latest first
  def get_ammounts(account_id)
    return Ammount.where(:account_id => account_id).sort_by { |h| h[:date]}.reverse
  end
  
  # get the latest amount else return zero
  def get_latest_ammount(account_id)
    if ammounts_count(account_id) > 0
      latest_amnt = get_ammounts(account_id).first
      return latest_amnt.ammount
    else
      return 0
    end
  end
  
  # get the latest amount and date formatted for viewing
  def get_latest_ammount_formatted(account_id)
    if ammounts_count(account_id) > 0
      latest_amnt = get_ammounts(account_id).first
      string = latest_amnt.ammount.to_s + " at " + latest_amnt.date.to_s
      return string
    else
      string =  "no ammounts recorded"
      return string
    end
  end
  
  # get the latest change in value, compare last two month values
  def get_latest_change(account_id)
    if ammounts_count(account_id) >= 2
      ammounts = get_ammounts(account_id)
        return (ammounts.first.ammount.to_i- ammounts.second.ammount.to_i)   
    else
      return 0
    end
  end
  
  # get the latest percentage change in value, compare last two month values
  def get_latest_percentage_change(account_id)
    if ammounts_count(account_id) >= 2
      ammounts = get_ammounts(account_id)
      change = (ammounts.first.ammount.to_i- ammounts.second.ammount.to_i)
        return number_to_percentage((change.to_f/ammounts.second.ammount.to_i)*100)
        #((ammounts.first.ammount.to_i- ammounts.second.ammount.to_i)/ammounts.second.ammount.to_i)   
    else
      return 0
    end
  end
  
  
end
