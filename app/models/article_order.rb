class ArticleOrder < ApplicationRecord
  belongs_to :order
  belongs_to :article

  validates :quantity, presence: true

  def total
    article.price * quantity
  end
end
