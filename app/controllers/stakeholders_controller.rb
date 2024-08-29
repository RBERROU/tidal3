class StakeholdersController < ApplicationController
  def index
    @stakeholders = Stakeholder.all
  end

  def show
    @stakeholder = Stakeholder.find(params[:id])
  end

  def new
    @stakeholder = Stakeholder.new
    @challenges = Challenge.all
  end

  def create
    @stakeholder = Stakeholder.new(stakeholder_params)

    if @stakeholder.save
      redirect_to stakeholders_path, notice: 'Stakeholder was successfully created.'
    else
      render :new
    end
  end

  def edit
    @stakeholder = Stakeholder.find(params[:id])
    @challenges = Challenge.all
  end

  def update
    @stakeholder = Stakeholder.find(params[:id])
    if @stakeholder.update(stakeholder_params)
      redirect_to stakeholder_path(@stakeholder), notice: 'Stakeholder was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @stakeholder = Stakeholder.find(params[:id])
    @stakeholder.destroy
    redirect_to stakeholders_path, notice: 'Stakeholder was successfully deleted.'
  end

  private

  def stakeholder_params
    params.require(:stakeholder).permit!
  end
end
