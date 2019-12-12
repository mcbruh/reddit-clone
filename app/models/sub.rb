class Sub < ApplicationRecord
    belongs_to :moderator, class_name: 'User', 
    foreign_key: 'moderator_id', primary_key: 'id', inverse_of: 'subs'
end
