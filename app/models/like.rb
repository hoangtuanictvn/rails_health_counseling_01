class Like < ApplicationRecord
  belongs_to :target, polymorphic: true
  belongs_to :user
end
