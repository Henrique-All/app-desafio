class Consent < ApplicationRecord
  belongs_to :user

  PURPOSES = %w[marketing analytics newsletter].freeze

  validates :purpose, presence: true
  validates :purpose, inclusion: { in: PURPOSES }

  scope :granted, -> { where(granted: true) }
  scope :revoked, -> { where(granted: false) }

  def status
    granted ? 'granted' : 'revoked'
  end
end