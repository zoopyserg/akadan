class Comment < ActiveRecord::Base
  ### INCLUDES
  ### DEFAULT SCOPE
  ### CONSTANTS
  ### ATTR ACCESSORS
  ### ENUMS
  ### RELATIONS (belongs to, has_many, has_many through)
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  has_many :comments, as: :commentable, dependent: :destroy

  ### VALIDATIONS (validates, validate)
  validates :body, :presence => true
  validates :user, :presence => true

  ### CALLBACKS
  ### NESTED ATTRIBUTES
  ### SCOPES
  scope :find_comments_by_user, lambda { |user|
    where(:user_id => user.id).order('created_at DESC')
  }

  scope :find_comments_for_commentable, lambda { |commentable_str, commentable_id|
    where(:commentable_type => commentable_str.to_s, :commentable_id => commentable_id).order('created_at DESC')
  }

  ### ACTS_AS..., GEOCODED_BY, AUTOSTRIP_ATTRIBUTES, ATTACHED FILES and other non-standard special keywords

  acts_as_votable
  ### CLASS METHODS
  ### PRIVATE CLASS METHODS
  ### INSTANCE METHODS
  ### PRIVATE METHODS
end
