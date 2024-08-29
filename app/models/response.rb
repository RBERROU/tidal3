class Response < ApplicationRecord
  belongs_to :stakeholder
  belongs_to :challenge

  # Validations to ensure data integrity
  validates :impact_materiality, presence: true, numericality: { only_integer: true }
  validates :financial_materiality, presence: true, numericality: { only_integer: true }
  validates :challenge_id, presence: true
end