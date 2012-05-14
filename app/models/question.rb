class Question < ActiveRecord::Base

  #Relationships
  has_many :groups
  belongs_to :group
  belongs_to :section
  has_one :presentoption
  has_one :answer

end
