class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :start, presence: true
  validates :finish, presence: true
  validates :count, presence: true

  validate :date_before_start
  validate :date_before_finish
  def date_before_start
    return if start.blank?
    errors.add(:start, "は今日以降のものを選択してください") if start < Date.today
  end

  def date_before_finish
    return if finish.blank? || start.blank?
    errors.add(:finish, "は開始日以降のものを選択してください") if finish < start
  end

end
