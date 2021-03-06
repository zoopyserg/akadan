class User < ApplicationRecord
  ### INCLUDES
  ### DEFAULT SCOPE
  ### CONSTANTS
  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  has_many :records, dependent: :destroy
  has_many :record_types, dependent: :destroy
  has_many :connection_types, dependent: :destroy
  has_many :connections, dependent: :destroy
  has_many :sensors, dependent: :destroy
  has_many :groups # NOT(!) dependent: :destroy
  has_many :designs, dependent: :destroy

  has_many :bookmarks, dependent: :destroy
  has_many :favourite_records, through: :bookmarks, class_name: 'Record', foreign_key: :record_id, source: :record

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'

  has_many :readings, dependent: :destroy
  has_many :messages, through: :readings

  has_many :participations, dependent: :destroy
  has_many :conversations, through: :participations

  has_many :friend_requests, dependent: :destroy
  # oh. wait. think about how to do it. friendships.
  has_many :friends, through: :friend_requests, class_name: 'User', foreign_key: 'friend_id'
  has_many :users, through: :friend_requests

  has_many :blockings, dependent: :destroy
  has_many :blocked_users, through: :blockings, class_name: 'User', foreign_key: 'blocked_user_id'

  has_many :user_record_stats, dependent: :destroy

  has_many :comments # dependent: :destroy ?
  has_many :votes # dependent: destroy ?
  ### VALIDATIONS (validates, validate)
  validates :first_name, presence: true, only_international_letters: true
  validates :last_name, presence: true, only_international_letters: true

  validates :username, presence: true, uniqueness: true, only_latin_alphanumeric_symbols: true

  validates :accept_terms, inclusion: { in: [true], message: 'Please accept the Terms.' }

  ### CALLBACKS
  ### NESTED ATTRIBUTES
  ### SCOPES
  scope :all_public_ids, -> { where(is_public: true).pluck(:id) }
  scope :blocked_users_ids, -> (instance) { Blocking.where(user: instance).pluck(:blocked_user_id) }
  scope :blocked_by_users_ids, -> (instance) { Blocking.where(blocked_user: instance).pluck(:user_id) }
  scope :my_friend_ids, -> (instance) { instance.friends.pluck(:id) }
  scope :for_who_i_am_a_friend_ids, -> (instance) { User.joins(:friend_requests).where(friend_requests: { friend_id: instance.id } ).pluck(:id) }
  scope :mutual_friend_ids, -> (instance) { my_friend_ids(instance) & for_who_i_am_a_friend_ids(instance) }
  scope :mutual_friends, -> (instance) { where(id: mutual_friend_ids(instance)) }
  scope :who_thinks_they_are_friends_of, -> (instance) { where(id: for_who_i_am_a_friend_ids(instance)) }

  scope :visible_users_for, -> (instance) { where(id: ((all_public_ids + mutual_friend_ids(instance)) - [instance.id, blocked_users_ids(instance), blocked_by_users_ids(instance)].flatten )) }

  scope :visible_friends_for, -> (instance) { where(id: (mutual_friend_ids(instance) + for_who_i_am_a_friend_ids(instance))) }
  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  mount_uploader :avatar, AvatarUploader

  ### CLASS METHODS
  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  def mutual_friends
    User.mutual_friends(self)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def blocked?(someone_else)
    blocked_users.include? someone_else
  end

  def did_not_block?(someone_else)
    !blocked?(someone_else)
  end

  def sent_friend_request_to?(someone_else)
    self.friends.include?(someone_else) && !someone_else.friends.include?(self)
  end

  def mutual_friend_of?(someone_else)
    User.mutual_friends(someone_else).include? self
  end

  def can_become_a_friend_of?(someone_else)
    !User.mutual_friends(someone_else).include?(self) && someone_else.did_not_block?(self) && !someone_else.sent_friend_request_to?(self) && !sent_friend_request_to?(someone_else)
  end

  def bookmarked?(_record)
    bookmarks.where(record: _record).exists?
  end
  ### PRIVATE METHODS
end
