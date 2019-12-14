class Post < ApplicationRecord
    validates :title, presence: true
    belongs_to :author, class_name: 'User', foreign_key: 'author_id',
    primary_key: 'id', inverse_of: 'posts'
end
