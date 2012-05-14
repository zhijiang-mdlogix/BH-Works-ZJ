class Survey < ActiveRecord::Base

  # Relationships
  has_many :sections
end
