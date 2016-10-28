class GuestQueue < ApplicationRecord
  LOCKET_TYPE = %w(A B C)

  validates :name, presence: true
end
