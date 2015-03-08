module ApplicationHelper
  
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
      if ((get_ammounts(account_id).first.ammount.to_i)) == 0
        latest_amnt = get_ammounts(account_id).second        
      else  
        latest_amnt = get_ammounts(account_id).first
      end
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
  
  # get the lastest value of each open account
  def get_total_worth
    accounts = Account.where(:status => "Open")
    total_worth = 0
    accounts.each do |account|
      total_worth += get_latest_ammount(account).to_i
    end
    return total_worth  
  end


def get_last_year_ammount(account_id)
   if ammounts_count(account_id) > 11
      last_year_amnt = get_ammounts(account_id)[11]
      return last_year_amnt.ammount
    else
      return 0
    end
end

def get_annual_change(account_id)
  if ammounts_count(account_id) > 11
      return get_latest_ammount(account_id).to_f - get_last_year_ammount(account_id).to_f
    else
      return 0
    end
end

def get_annual_percentage_change(account_id)
  if ammounts_count(account_id) > 11
      return number_to_percentage(((get_annual_change(account_id).to_f) / (get_last_year_ammount(account_id).to_f))*100, precision: 0)
    else
      return 0
    end
end


  
  #
  def this_month_records_exists
    date = Time.now 
    records_count = Ammount.where(:date =>(date.beginning_of_month..date.end_of_month)).count
    if records_count > 0
      return true
    else
      return false
    end
  end
  
  
end
