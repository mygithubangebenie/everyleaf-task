class Label < ApplicationRecord
    has_many :tasks_labels, dependent: :destroy
    has_many :tasks, through: :tasks_labels
    validates_presence_of :name, :content, :user_id
    belongs_to :user
    accepts_nested_attributes_for :tasks_labels, :reject_if => proc { |a|
    a['label_id'].blank? }
 accepts_nested_attributes_for :tasks
end
