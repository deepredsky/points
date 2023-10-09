module ActivitiesHelper
  def activity_status_icon(activity)
    case activity.status
    when "approved"
      '✅'
    when "pending"
      '🕣'
    when "rejected"
      '🚫'
    else
      ''
    end
  end

  def activity_status(activity)
    content_tag :span, title: activity.status do
      activity_status_icon(activity)
    end
  end
end
