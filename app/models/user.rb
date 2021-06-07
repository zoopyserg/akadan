class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :records, dependent: :destroy
  has_many :record_types, dependent: :destroy
  has_many :connection_types, dependent: :destroy
  has_many :connections, dependent: :destroy
  has_many :sensors, dependent: :destroy

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'

  has_many :readings, dependent: :destroy
  has_many :messages, through: :readings

  has_many :participations, dependent: :destroy
  has_many :conversations, through: :participations

  validates :first_name, presence: true, only_international_letters: true
  validates :last_name, presence: true, only_international_letters: true

  validates :username, presence: true, uniqueness: true, only_latin_alphanumeric_symbols: true

  validates :accept_terms, inclusion: { in: [true], message: 'Please accept the Terms.' }

  mount_uploader :avatar, AvatarUploader

  def name
    "#{first_name} #{last_name}"
  end

end
