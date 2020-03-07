class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :firstname, presence: true

  ONLINE_PERIOD = 0.2.minutes

  scope :online, -> { where('updated_at > ?', ONLINE_PERIOD.ago) }

  def online?
    updated_at > ONLINE_PERIOD.ago
  end
end