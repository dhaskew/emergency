class AlertMailer < ActionMailer::Base

  def send_alert button_id
    #@button = button
    mail(from: "foo@bar.com", to: "davidaskew@gmail.com", subject: "test", body: "test") do |format|
      format.text
      format.html
    end
  end

=begin
  def send_recommendation recommendation
    @text = recommendation.text
    @sender = recommendation.sender
    @recipient = recommendation.recipient
    @book = recommendation.book
    mail(from: @sender.email, to: @recipient.email, subject: "Book Recommendation", body: @text) do |format|
      format.text
      format.html
    end
  end
=end

end
