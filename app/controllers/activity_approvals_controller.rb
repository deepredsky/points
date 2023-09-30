class ActivityApprovalsController < ApplicationController
  def create
    activity = Activity.pending.where.not(user: current_user).find(params[:activity_id])

    if activity
      activity.approved!
      redirect_to root_path, notice: "Activity approved"
    else
      redirect_to root_path, notice: "Invalid activity"
    end
  end
end
