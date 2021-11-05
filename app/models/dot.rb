class Dot < ApplicationRecord
  belongs_to :user
  belongs_to :record
  belongs_to :project, class_name: 'Record'

  validates_presence_of :duration

  # todo: has_many photos
  # todo: has_many attachments
end
