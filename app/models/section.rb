class Section < ActiveRecord::Base

  # Relationships.
  has_many :questions
  has_many :sections
  belongs_to :section


end
