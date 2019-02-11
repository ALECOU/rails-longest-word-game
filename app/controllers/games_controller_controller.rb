require 'open-uri'
require 'json'

class GamesControllerController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    grid = params['cacher']
    @answer = params[:answer].upcase
    @result = "Sorry, but #{@answer} can't be build out of #{grid}"
    # bool = false
    if @answer.size < grid.size && huissier(grid, @answer)
      url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
      result_serialized = open(url).read
      result = JSON.parse(result_serialized)
      if result["found"]
        @result = "Congratulations! #{@answer} is a valid English word!"
      else
        @result = "Sorry but, #{@answer} does not seem to be a valid English word..."
      end
    end
  end

  def huissier(grid, attempt)
    p attempt.upcase.split("")
    attempt.upcase.split("").each do |char|
      if grid.count(char) >= attempt.upcase.split("").count(char)
      else return false
      end
    end
    return true
  end
end
