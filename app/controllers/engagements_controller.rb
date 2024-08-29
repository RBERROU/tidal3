class EngagementsController < ApplicationController
  def index
    @stakeholders = Stakeholder.all
  end

  def questionnaire
    @stakeholder = Stakeholder.find(params[:id])
    @challenges = @stakeholder.challenges
    @responses = @stakeholder.responses  # Load existing responses
  end

  def submit_questionnaire
    @stakeholder = Stakeholder.find(params[:id])
    
    response_params[:responses].each do |response|
      # Find or initialize a response record for the given challenge
      existing_response = Response.find_or_initialize_by(
        stakeholder_id: @stakeholder.id,
        challenge_id: response[:challenge_id]
      )
      
      # Update the existing response or create a new one
      existing_response.update(
        impact_materiality: response[:impact_materiality],
        financial_materiality: response[:financial_materiality]
      )
    end
    
    redirect_to engagements_path, notice: 'Questionnaire submitted successfully!'
  end

  private

  def response_params
    params.require(:stakeholder).permit(responses: [:challenge_id, :impact_materiality, :financial_materiality])
  end
end
