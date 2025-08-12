class Video < ApplicationRecord
  belongs_to :course
  has_many :reviews, dependent: :destroy
  
  has_one_attached :file
  
  validates :title, presence: true
  validates :description, presence: true 
  validates :file, presence: true
end
