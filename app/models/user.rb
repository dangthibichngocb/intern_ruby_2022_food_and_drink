class User < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true
  enum role: {
    user: Settings.const.users.role.user,
    admin: Settings.const.users.role.admin
  }

  enum status: {active: 1, block: 2}

  enum status: {block: 2, active: 1}

  before_save :email_downcase

  validates :name, presence: true,
    length: {
      minium: Settings.const.users.name.length.min,
      maximum: Settings.const.users.name.length.max
    }
  validates :email, presence: true,
    length: {
      minium: Settings.const.users.email.length.min,
      maximum: Settings.const.users.email.length.max
    },
    format: {with: Settings.const.users.email.regex},
    uniqueness: true

  validates :phone, presence: true, uniqueness: true

  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.const.users.password.length.min},
    allow_nil: true

  scope :latest_user, ->{order created_at: :desc}

  def email_downcase
    email.downcase!
  end

  class << self
    def statuses_i18n
      statuses.each_with_object({}) do |(k, _), obj|
        obj[I18n.t("user.status.#{k}")] = k
      end
    end
  end

  def status_i18n
    I18n.t("user.status.#{status}")
  end
end
