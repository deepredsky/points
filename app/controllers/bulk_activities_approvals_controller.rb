class BulkActivitiesApprovalsController < ApplicationController
  def create
    Activity.where(id: params[:activities], status: :pending).where.not(user: current_user).each do |activity|
      activity.approved!
    end

    redirect_to root_path, notice: "Activity approved"
  end
end
