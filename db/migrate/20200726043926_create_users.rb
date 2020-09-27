class CreateUsers < ActiveRecord::Migration[5.2]
  def change
       create_table :users do |t|
      t.string :name, :nill => false
      t.string :password_digest, :null=> false
      t.string :password, :nill => false
      t.string :password_confirmation, :nill => false
      t.string :simple_word, :nill => true, :defalut => 'よろしく！'
      t.string :color, :nill => false
      t.string :place, :nill => true
      t.references :question
      t.references :course
      t.timestamps null: false
    end
  end
end
