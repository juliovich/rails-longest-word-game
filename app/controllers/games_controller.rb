require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    #@ran = rand(36**length).to_s(36)
    alphabet = ('a'..'z').to_a
#=> ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    @rand = 10.times.map { alphabet.sample }
    #@rand = 10.times alphabet.sample
  end

  def score
    @rand = params[:rand]
    @word = params[:word]
    url= "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_serialized = open(url).read
    @result = JSON.parse(user_serialized)
    if @result["found"]
      @result_found = @result["found"]
      @view_result = "Congratulations! The word #{@word} is an English word."
      @word.split.each do |letter|
        if @rand.include?(letter)
        else
          return @view_result2 = "Not correct. You have used incorrects letters"
        end
        @view_result2 = "Congratulations! The word #{@word} is making with #{@rand} letters."
      end
    end
  end
end
