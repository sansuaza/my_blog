class Article < ApplicationRecord
  include Visible

  belongs_to :owner, class_name: 'User'
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  # Handle of dont permit that the article dont get the same title
  validates :title, uniqueness: {case_insensitive: false}
end
