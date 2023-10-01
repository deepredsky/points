class DashboardsController < ApplicationController
  def index
    @tasks = Task.all
    @my_activities = current_user.activities.order(created_at: :desc).limit(20)
    @my_points = ActivityPoints.new(current_user, 'Me')

    @friends_points = current_user.friends.map do |friend|
      ActivityPoints.new(friend)
    end

    @activities_to_review = Activity.pending.where.not(user: current_user).limit(20)
  end
end
