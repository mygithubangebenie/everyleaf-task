class Task < ApplicationRecord

  validates :name, :status, :startdate, :enddate, :content, :priority, presence: true
  belongs_to :user
  enum priority: [:low, :medium, :high]
  has_many :tasks_labels, dependent: :destroy
 has_many :labels, through: :tasks_labels
 accepts_nested_attributes_for :tasks_labels, :reject_if => proc { |a|
    a['label_id'].blank? }
 accepts_nested_attributes_for :labels
    def self.order_list(sort_order)
        if sort_order == "priority"
          order(priority: :desc)
        elsif sort_order == "enddate"
          order(enddate: :desc)
        else
          order(startdate: :desc)
        end
      end
      paginates_per 2
     
end
