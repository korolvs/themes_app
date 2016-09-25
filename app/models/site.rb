class Site < ApplicationRecord
  validates :name, :primary, :secondary, :background, presence: true
  validates :name, uniqueness: true

  def initialize(name, primary, secondary, background)
    super()
    self.name = name
    self.primary = primary
    self.secondary = secondary
    self.background = background
  end
end
