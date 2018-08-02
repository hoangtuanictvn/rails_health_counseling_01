class Question < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :likes, as: :target
  has_many :answers, dependent: :destroy
  has_many :question_categories, foreign_key: :question_id, dependent: :destroy
  has_many :categories, through: :question_categories, source: :major

  pg_search_scope :search,
    against: [:title, :content],
    using: {
      tsearch: {
        prefix: true
      }
    }
end
