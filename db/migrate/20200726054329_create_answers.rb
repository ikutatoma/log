class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question
      t.references :user
      t.string :title
      t.string :content
    end
  end
end
