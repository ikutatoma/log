class CreateCoursesQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :course_questions do |t|
      t.references :course
      t.references :question
    end
  end
end
