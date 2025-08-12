class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: {admin: 0, instructor: 1, student: 2}

  has_many :courses, foreign_key: :instructor_id, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :enrolled_courses, through: :enrollments, source: :course

  has_many :reviews, dependent: :destroy

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id', dependent: :destroy
end
