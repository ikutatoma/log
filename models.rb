require 'bundler/setup'
Bundler.require

if development?
  ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end

class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :likes
  has_many :courses
  has_many :user_courses, through: :courses
  has_many :likes, through: :questions
  has_secure_password
end

class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :likes
  has_many :courses
  has_many :course_questions, through: :courses
  has_many :likes, through: :users

end

class Course < ActiveRecord::Base
  has_many :users
  has_many :user_courses, through: :users
  has_many :questions
  has_many :course_questions, through: :questions
end

class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :answer
end

class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
end

class User_course < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
end

class Course_question <  ActiveRecord::Base
 belongs_to :course
 belongs_to :question
end