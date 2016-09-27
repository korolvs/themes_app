class Site < ApplicationRecord
  validates :name, :primary, :secondary, :background, presence: true
  validates :name, uniqueness: true

  DEFAULT_PRIMARY = 'darken(#428bca, 6.5%)'
  DEFAULT_SECONDARY = '#5cb85c'
  DEFAULT_BACKGROUND = '#fff'

  scope :just_updated, -> { where('updated_at > ?', Time.now - 60)}

  def initialize(name)
    super()
    self.name = name
    self.primary = DEFAULT_PRIMARY
    self.secondary = DEFAULT_SECONDARY
    self.background = DEFAULT_BACKGROUND
  end
end
