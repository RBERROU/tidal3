class Challenge < ApplicationRecord
    has_many :challenge_stakeholders
    has_many :stakeholders, through: :challenge_stakeholders
    has_many :responses
  
    validates :name, presence: true
    validates :category, presence: true
    validates :subcategory, presence: true

    # Method to calculate the average impact materiality score
    def average_impact_materiality
    responses.average(:impact_materiality).to_f
    end

    # Method to calculate the average financial materiality score
    def average_financial_materiality
    responses.average(:financial_materiality).to_f
    end
end
