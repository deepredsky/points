class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :task, optional: true

  enum :status, { pending: 0, approved: 1, rejected: 2 }, prefix: false, scopes: true
end
