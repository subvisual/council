require 'rails_helper'

RSpec.describe Notification, type: :model do
  context '.new_comment' do
    it 'creates a comment notification for a user' do
      comment = create :comment
      user = create :user

      notification = Notification.new_comment(user: user, comment: comment)

      expect(notification).to be_persisted
    end
  end

  context '#send_email' do
    it 'sends an email after creation' do
      discussion = create :discussion

      expect do
        create :notification, discussion: discussion
      end.to change { ActionMailer::Base.deliveries.count }.by 1
    end
  end
end
