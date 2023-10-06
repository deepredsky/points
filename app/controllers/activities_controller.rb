class ActivitiesController < ApplicationController
  def index
  end

  def create
    Task.where(id: params[:tasks]).each do |task|
      current_user.activities.create(task: task, name: task.name, point: task.point, status: :pending)
    end

    redirect_to root_path, notice: "Activities added"
  end
end
