class User < ApplicationRecord
  extend FriendlyId
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :lockable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  enum block_status: {blocked: 0, non_block: 1}

  friendly_id :email_slug, use: :slugged

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy, foreign_key: :receiver_id

  mount_uploader :avatar, ImageUploader

  validates :email, presence: true,
    length: {maximum: Settings.user.email_maximum_length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :name, presence: true,
    length: {maximum: Settings.user.name_maximum_length}
  validates :password, presence: true,
    length: {minimum: Settings.user.password_minimum_length},
    allow_nil: true

  scope :search, (lambda do |keyword|
    keyword = keyword.to_s.strip
    where "name LIKE ? ", "%#{sanitize_sql_like keyword}%" unless keyword.blank?
  end)

  def current_user? user
    self == user
  end

  def email_slug
    "#{email.gsub(/@[a-z\d\-.]+\.[a-z]+\z/, '')} #{id}"
  end

  def doctor_active?
    is_a?(Doctor) && doctor_activated?
  end

  def status
    if activated?
      I18n.t "admin.users.activated"
    else
      I18n.t "admin.users.unactivated"
    end
  end
end
