class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :titulo
      
      t.timestamps
    end
  end
end
