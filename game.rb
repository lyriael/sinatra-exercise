require 'rubygems'
require 'sinatra'
require 'backports' #needed to .sample works for arrays...

before do
  content_type :txt
  @defeat = {'rock' => 'scissors' , 'paper'  => 'rock' , 'scissors'  => 'paper' }
  @throws = @defeat.keys
end

get '/throw/:type' do
  player_throw = params[:type].to_s
  
  if !@throws.include?(player_throw)
    halt 403, "You must throw one of the following: #{@throws}"
  end
  
  computer_throw = @throws.sample
  
  if player_throw == computer_throw
    "You tied with the computer. Try again!"
  elsif player_throw == @defeat[computer_throw]
    "Ouch; #{computer_throw} beats #{player_throw}. Better luck next time!"
  else
    "Nicely done; #{player_throw} beats #{computer_throw}"
  end
  
end
