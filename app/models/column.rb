class Column < ApplicationRecord
  has_one_attached :image
  belongs_to :user, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @column = Column.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @column = Column.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @column = Column.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @column = Column.where("title LIKE?","%#{word}%")
    else
      @column = Column.all
    end
  end
  
end
