class Group < ApplicationRecord
  has_many :concerts, dependent: :destroy
  
  validates :members_gender, presence: true
  validates :name, presence: true
  validates :debut_date, presence: true
  validates :members_n, :numericality => { :greater_than => 0 }
  enum members_gender: [:men, :woman, :band]

  def to_s
    name
  end

  def number_concerts
    Concert.references(:groups).where(group_id: id).count
  end

  def number_people
    Concert.references(:groups).where(group_id: id).sum(:assistance)
  end

  def concert_this_month
    @concerts= Concert.references(:groups).where(group_id: id)
    @concerts.map { |concert| concert.date.month }.count(Time.now.month)
  end

  def last_concert
    @concerts.map { |concert| (concert.date).strftime("%Y-%B-%A") }.last
  end

  def max_people
    @concerts.map { |concert| (concert.assistance) }.max

  end

  def max_time
    @concerts.map { |concert| (concert.duration) }.max
  end


end
