# frozen_string_literal: true

# app/mailers/application_mailer.rb

# Descrição da classe ApplicationMailer
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
