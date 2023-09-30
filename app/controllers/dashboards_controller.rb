class DashboardsController < ApplicationController
  def index
    @tasks = Task.all
    @my_activities = current_user.activities.order(created_at: :desc).limit(20)
    @points = current_user.activities.approved.where(created_at: (Time.now.beginning_of_week..Time.now.end_of_week)).sum(:point)
    @pending_points = current_user.activities.pending.where(created_at: (Time.now.beginning_of_week..Time.now.end_of_week)).sum(:point)

    @activities_to_review = Activity.pending.where.not(user: current_user).limit(20)
  end
end
