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
      # url_for系は使えない,path ならいける。
      # stocks_destroy_path(result)
      { :controller => method, :action => 'destroy', :format => result }
    elsif method == 'entries'
      { :controller => method, :action => 'new', :format => result }
    else
      { :controller => method, :action => 'create', :format => result }
    end
  end
end