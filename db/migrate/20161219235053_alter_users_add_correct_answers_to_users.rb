class AlterUsersAddCorrectAnswersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :correctanswers, :integer
  end
end
