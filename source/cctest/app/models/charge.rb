class Charge < ActiveRecord::Base
  belongs_to :customer

  scope :successful,  -> { where(paid: true, disputed: false) }
  scope :failed,      -> { where(paid: false) }
  scope :disputed,    -> { where(paid: true, disputed: true) }
end
