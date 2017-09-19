class User < ApplicationRecord
  include EnsureSecureId
  extend  FriendlyId

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true

  after_create :_send_welcome_email

  before_validation :_ensure_secure_id
  friendly_id       :secure_id, use: [ :slugged, :history, :finders ]

  private

  def _send_welcome_email
    UserMailer.send_welcome_email(self).deliver_later
  end
end
