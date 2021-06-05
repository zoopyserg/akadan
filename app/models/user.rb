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
  # has_many :messages, dependent: :destroy
  has_many :message_chains, dependent: :destroy

  validates :first_name, presence: true, only_international_letters: true
  validates :last_name, presence: true, only_international_letters: true

  validates :username, presence: true, uniqueness: true, only_latin_alphanumeric_symbols: true

  validates :accept_terms, inclusion: { in: [true], message: 'Please accept the Terms.' }

  # todo: username: AnYNameCase to lowercase - yep. and "case taken" too. before validation probably? or make a separate validator? or make a separate validator? dunno

  # todo: first_name: AnYNameCase to Normal? McDonald should work probably no?
  # todo: last_name: AnYNameCase to Normal? McDonald should work probably no?
end
