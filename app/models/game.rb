class Game < ActiveRecord::Base
  validates :trump_type_id, presence: true

  belongs_to :trump_type
end
