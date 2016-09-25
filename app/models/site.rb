class Site < ApplicationRecord
  validates :name, :primary, :secondary, :background, presence: true
  validates :name, uniqueness: true

  DEFAULT_PRIMARY = 'rgb(21, 140, 186)'
  DEFAULT_SECONDARY = 'rgb(40, 182, 44)'
  DEFAULT_BACKGROUND = 'rgb(255, 255, 255)'

  def initialize(name)
    super()
    self.name = name
    self.primary = DEFAULT_PRIMARY
    self.secondary = DEFAULT_SECONDARY
    self.background = DEFAULT_BACKGROUND
  end
end
