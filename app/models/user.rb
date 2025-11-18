class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :consents, dependent: :destroy

  def consent_status_for(purpose)
    consent = consents.find_by(purpose: purpose)
    return 'undefined' if consent.nil?
    consent.granted ? 'granted' : 'revoked'
  end

  def consent_for(purpose)
    consents.find_by(purpose: purpose)
  end
end