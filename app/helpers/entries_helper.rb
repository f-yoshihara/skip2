module EntriesHelper
  def show_status(recruitment)
    if recruitment.status == 'published'
      '送信済み'
    elsif recruitment.status == 'draft'
      '下書き' 
    end
  end
end
