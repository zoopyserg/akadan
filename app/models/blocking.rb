class Blocking < ApplicationRecord
  ### INCLUDES
  ### DEFAULT SCOPE
  ### CONSTANTS
  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :user
  belongs_to :blocked_user, class_name: 'User'

  ### VALIDATIONS (validates, validate)
  ### CALLBACKS
  ### NESTED ATTRIBUTES
  ### SCOPES
  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords
  ### CLASS METHODS
  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  ### PRIVATE METHODS

  private
  def destroy_friendship
    FriendRequest.where(user: user, friend: blocked_user).destroy_all
    FriendRequest.where(user: blocked_user, friend: user).destroy_all
  end
end
