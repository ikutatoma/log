class CreateUsersCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :users_courses do |t|
      t.references :user
      t.references :course
    end
  end
end
