class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.text :answer
      t.references :question, index: true
      t.boolean :correctanswer

      t.timestamps null: false
    end
  end
end
