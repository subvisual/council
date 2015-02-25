class NotificationsMailer < ActionMailer::Base
  default 'app_name' => 'Council'
  default from: 'hq@groupbuddies.com'

  def new_notification(notification_id)
    @notification = Notification.where(id: notification_id).first
    @discussion = @notification.discussion
    @url = root_url(anchor: anchor_for_notification(@notification))

    mail to: @notification.email, subject: '[Council] New discussion', template_name: @notification.kind
  end

  private

  def anchor_for_notification(notification)
    case notification.kind
    when 'new_discussion' then "/discussions/#{notification.discussion.id}"
    when 'new_comment'    then "/discussions/#{notification.discussion.id}/comments/#{notification.discussion.comments.last.id}"
    end
  end
end
