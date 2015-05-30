class ContactMailer < ActionMailer::Base
  default to: 'yuko.lina@gmail.com'

  def contact_email(name, email, boody)
    @name = name
    @email = email
    @body = body
    
    mail(from: email, subject: 'Contact From Message')
  end
end