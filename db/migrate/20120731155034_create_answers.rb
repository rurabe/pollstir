class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :response
      t.references :question
      t.text :body

      t.timestamps
    end
    add_index :answers, :response_id
    add_index :answers, :question_id
  end
end
