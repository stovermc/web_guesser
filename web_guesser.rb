require 'sinatra'
require 'sinatra/reloader'


get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb:index, :locals => { :message => message, :color => @color, :guess => guess }
end

SECRET_NUMBER = rand(100)

def check_guess(guess)
  if (guess - SECRET_NUMBER) > 5
    @color = 'crimson'
    "way too high!"
  elsif (guess - SECRET_NUMBER) < -5
    @color = 'crimson'
    "way too low!"
  elsif guess > SECRET_NUMBER
    @color = 'palevioletred'
    "too High!"
  elsif guess < SECRET_NUMBER
    @color = 'palevioletred'
    "too Low!"
  elsif guess == SECRET_NUMBER
    @color = 'seagreen'
    "Correct! The SECRET NUMBER is #{SECRET_NUMBER}. Nice Job."
  end
end
