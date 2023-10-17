class ActivitiesController < ApplicationController
  def index
    @pagy, @activities = pagy(current_user.activities)
  end

  def create
    Task.where(id: params[:tasks]).each do |task|
      current_user.activities.create(task: task, name: task.name, point: task.point, status: :pending)
    end

    redirect_to root_path, notice: "Activities added"
  end

  def destroy
    activity = current_user.activities.find(params[:id])

    if activity
      activity.destroy

      redirect_to root_path, notice: "Activities deleted"
    else
      redirect_to root_path, notice: "Activities not fonud"
    end
  end
end
