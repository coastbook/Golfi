class Club < ApplicationRecord
  
  belongs_to :user, optional: true
  
  validates :club_type, presence: true
  validates :club_name, presence: true
  
end
