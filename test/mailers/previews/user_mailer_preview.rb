# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/create_lesson
  def create_lesson
    UserMailer.create_lesson
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/complete_lesson
  def complete_lesson
    UserMailer.complete_lesson
  end

end
