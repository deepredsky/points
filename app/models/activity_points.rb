class ActivityPoints
  Point = Struct.new(:user, :approved, :pending)

  attr_reader :user

  def initialize(user, label = nil)
    @user = user
    @label = label
  end

  def daily
    range = Time.now.beginning_of_day..Time.now.end_of_day

    Point.new(
      user: user.email,
      approved: user.activities.approved.where(created_at: range).sum(:point),
      pending: user.activities.pending.where(created_at: range).sum(:point),
    )
  end

  def weekly
    range = Time.now.beginning_of_week..Time.now.end_of_week

    Point.new(
      user: user.email,
      approved: user.activities.approved.where(created_at: range).sum(:point),
      pending: user.activities.pending.where(created_at: range).sum(:point),
    )
  end

  def monthly
    range = Time.now.beginning_of_month..Time.now.end_of_month

    Point.new(
      user: user.email,
      approved: user.activities.approved.where(created_at: range).sum(:point),
      pending: user.activities.pending.where(created_at: range).sum(:point),
    )
  end

  def label
    @label || username
  end

  def username
    user.email.split('@').first.capitalize
  end
end
