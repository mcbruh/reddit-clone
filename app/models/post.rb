class Post < ApplicationRecord
    validates :title, presence: true
    belongs_to :author, class_name: 'User', foreign_key: 'author_id',
    primary_key: 'id', inverse_of: 'posts'
    has_many :post_subs, inverse_of: :post, dependent: :destroy
    has_many :subs, through: :post_subs, source: :sub
end
