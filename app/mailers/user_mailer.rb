class UserMailer < ActionMailer::Base
  default from: "data@bike_data.com"

  def send_it(csv_string)
    @cs = csv_string
    mail(to: "jeff_winkler@yahoo.com", subject: "Bike Test")
  end

end
