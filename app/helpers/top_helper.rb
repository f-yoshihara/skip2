module TopHelper
  def btn_text(result, method, text)
    # if current_user.stocks.where(recruitment_id: result.id).exists?
    #   text + '済み'
    # else
    #   text + 'する'
    # end
    if current_user && current_user.send(method).where(recruitment_id: result.id).exists?
      text + '済み'
    else
      text + 'する'
    end
  end

  def btn_url(result, method)
    if current_user && current_user.send(method).where(recruitment_id: result).exists?
      # url_for系とpathヘルパーは使えない。
      # stocks_destroy_path(result)
      { :controller => method, :action => 'destroy', :format => result }
    elsif method == 'entries'
      { :controller => method, :action => 'new', :format => result }
    else
      { :controller => method, :action => 'create', :format => result }
    end
  end
end

def stock_url(result)
  if current_user && current_user.stocks.where(recruitment_id: result).exists?
    # stocks_destroy_path(result)
    { :controller => 'stocks', :action => 'destroy', :format => result }
  else
    # stocks_create_path(result)
    { :controller => 'stocks', :action => 'create', :format => result }
  end
end

def entry_url(result)
  if current_user && current_user.entries.where(recruitment_id: result).exists?
    # edit_entry_path(result)
    { :controller => 'entries', :action => 'destroy', :format => result }
  else
    # new_entry_path(result)
    { :controller => 'entries', :action => 'new', :format => result }
  end
end