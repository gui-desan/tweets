# frozen_string_literal: true

class Relationship < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :requestee, class_name: 'User'

  enum relationship_type: %i[lover]
  enum status: %i[pending accepted]

  scope :pendings, -> { where(status: 0) }
  scope :accepteds, -> { where(status: 1) }
end
