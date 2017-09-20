class User < ApplicationRecord
  include EnsureSecureId
  extend  FriendlyId

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true

  after_create :send_welcome_email

  before_validation :_ensure_secure_id
  friendly_id       :secure_id, use: [ :slugged, :history, :finders ]

  def send_welcome_email
    UserMailer.send_welcome_email(self).deliver_later
  end
end
