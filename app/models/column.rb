class Column < ApplicationRecord
  has_one_attached :image
  belongs_to :user, optional: true
  has_many :post_comments, dependent: :destroy
end
