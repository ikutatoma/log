class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
     create_table :questions do |t|
      t.string :title, :nill => false;
      t.string :content, :nill => false;
      t.string :date, :nill => false;
      t.references :user
      t.references :course
      t.timestamps null: false
    end
  end
end
