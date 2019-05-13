class UserMailer < ApplicationMailer
  def create_lesson user, lesson
    @user = user
    @lesson = lesson
    mail to: user.email, subject: t(".create")
  end

  def complete_lesson user, lesson
    @user = user
    @lesson = lesson
    mail to: user.email, subject: t(".complete")
  end
end
