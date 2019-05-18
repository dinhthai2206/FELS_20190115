require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "create_lesson" do
    mail = UserMailer.create_lesson
    assert_equal "Create lesson", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "complete_lesson" do
    mail = UserMailer.complete_lesson
    assert_equal "Complete lesson", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
