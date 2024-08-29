class PolicyDocumentsController < ApplicationController
  def index
    @policy_documents = PolicyDocument.all
  end

  def new
    @policy_document = PolicyDocument.new
  end

  def create
    @policy_document = PolicyDocument.new(policy_document_params)

    if @policy_document.save
      redirect_to policy_documents_path, notice: 'Policy document was successfully uploaded.'
    else
      render :new
    end
  end

  private

  def policy_document_params
    params.require(:policy_document).permit(:title, :file)
  end
end
