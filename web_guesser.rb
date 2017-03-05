require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb:index, :locals => { :message => message, :guess => guess }
end

def check_guess(guess)
  if (guess - SECRET_NUMBER) > 5
    "way too high!"
  elsif (guess - SECRET_NUMBER) < -5
    "way too low!"
  elsif guess > SECRET_NUMBER
    "too High!"
  elsif guess < SECRET_NUMBER
    "too Low!"
  elsif guess == SECRET_NUMBER
    "Correct! The SECRET NUMBER is #{SECRET_NUMBER}. Nice Job."
  end
end
