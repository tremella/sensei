class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coach_slots, class_name: 'Slot', foreign_key: 'coach_id'
  has_many :student_slots, class_name: 'Slot', foreign_key: 'student_id' 
 
end

