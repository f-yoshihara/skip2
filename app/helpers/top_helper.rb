module TopHelper
  def btn_text(result, text)
    if current_user.stocks.where(recruitment_id: result.id).exists?
      text + '済み'
    else
      text + 'する'
    end
  end
end