class AddPromptToQuestions < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.remove :text
      t.text :prompt
    end
  end
end
