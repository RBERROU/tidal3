class ResultsController < ApplicationController
  def index
    @challenges = Challenge.all
  end
end
