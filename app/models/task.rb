class Task < ApplicationRecord
    belongs_to :user
    enum status: {backlog: 0, wip: 1, closed:2}

    with_options presence: true do
        validates :title
        validates :content
        validates :deadline
        validates :status_id
    end

    paginates_per 10

    scope :index_all, -> {
        where(status_id: [1,2])
        .select(:id, :title, :content, :deadline, :status_id, :user_id)
        .order(created_at: :desc)
        .includes(:user)
    }
end
