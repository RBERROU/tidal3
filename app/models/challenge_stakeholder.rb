class ChallengeStakeholder < ApplicationRecord
  belongs_to :challenge
  belongs_to :stakeholder
end
