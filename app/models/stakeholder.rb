class Stakeholder < ApplicationRecord
    has_many :challenge_stakeholders
    has_many :challenges, through: :challenge_stakeholders
    has_many :responses
  
    validates :name, presence: true
    validates :role, presence: true
    validates :category, presence: true
    validates :subcategory, presence: true
  end