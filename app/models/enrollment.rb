class Enrollment < ApplicationRecord

  belongs_to :user
  belongs_to :course

  validates :user_id, uniqueness: { scope: :course_id, message: "Bu kursa zaten kayıtlı" }
  validate :cannot_enroll_in_own_course

  def cannot_enroll_in_own_course
    if course.instructor_id == user_id
      errors.add(:base, "Kendi kursuna kayıt olamazsın")
    end
  end
end
