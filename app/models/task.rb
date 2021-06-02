class Task < ApplicationRecord
    belongs_to :user
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :status

    with_options presence: true do
        validates :title
        validates :content
        validates :deadline
        validates :status_id
    end
end
