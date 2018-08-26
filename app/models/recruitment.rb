class Recruitment < ApplicationRecord
  belongs_to :company
  belongs_to :occupation
  has_many :entry_sheets
  has_many :staffs, through: :company
  enum status: {draft:0, published:1, deleted:2}
  validates :status,
    presence: true
  validates :title,
    presence: true
  validates :body,
    presence: true
  validates :deadline,
    presence: true
  # validate :file_invalid?

  def deta=(data)
    self.ctype = data.content_type
    self.photo = data.read
  end

  # private
  #   def file_invalid?
  #     ps = ['image/jpeg', 'image/gif', 'image/png']
  #     errors.add(:photo, 'は画像ファイルではありません。') if !ps.include?(self.ctype)
  #     errors.add(:photo, 'のサイズが1MBを超えています。') if self.photo.length > 1.megabyte
  #   end
end
