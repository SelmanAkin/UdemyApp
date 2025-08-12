class Review < ApplicationRecord
  belongs_to :user
  belongs_to :video

  validates :rating, inclusion: { in: 1..5, message: "1 ile 5 arasında olmalı" }
  validates :user_id, uniqueness: { scope: :video_id, message: "Bu videoyu zaten değerlendirdin" }
  
end
