class ChallengesController < ApplicationController
    def index
      @challenges = Challenge.all
      @challenge = Challenge.new
    end
  
    def show
      @challenge = Challenge.find(params[:id])
    end
  
    def new
      @challenge = Challenge.new
    end
  
    def create
      @challenge = Challenge.new(challenge_params)
      if @challenge.save
        redirect_to challenges_path, notice: 'Challenge was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @challenge = Challenge.find(params[:id])
    end
  
    def update
      @challenge = Challenge.find(params[:id])
      if @challenge.update(challenge_params)
        redirect_to challenge_path(@challenge), notice: 'Challenge was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @challenge = Challenge.find(params[:id])
      @challenge.destroy
      redirect_to challenges_path, notice: 'Challenge was successfully deleted.'
    end
  
    private
  
    def challenge_params
      params.require(:challenge).permit(:name, :description, :category, :subcategory)
    end
end
  