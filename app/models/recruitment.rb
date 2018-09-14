class Recruitment < ApplicationRecord
  # has_and_belongs_to_many :users
  has_many :stocks
  has_many :users, through: :stocks
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
  validate :file_invalid?

  # ここは自動的に通過する。dataというパラメータがあれば
  def data=(data)
    self.ctype = data.content_type
    self.photo = data.read
  end

  private
    def file_invalid?
      ps = ['image/jpeg', 'image/gif', 'image/png']
      errors.add(:photo, 'は画像ファイルではありません。') if !ps.include?(self.ctype)
      errors.add(:photo, 'のサイズが1MBを超えています。') if self.photo.size > 1.megabyte
    end
end
