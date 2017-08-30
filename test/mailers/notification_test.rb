require 'test_helper'

class NotificationTest < ActionMailer::TestCase
  test "order_notification" do
    mail = Notification.order_notification
    assert_equal "Order notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
