class Candidate < ApplicationRecord

validates :name, :party, :age, :policy, presence: true
has_many :vote_logs
scope :young_people, -> {where('age<40')}
end
