require_relative 'base_view'

class SessionView < BaseView
  def wrong_credentials
    puts "Wrong credentials... Try again!"
  end
end
