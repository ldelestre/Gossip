class JoinUserVille < ActiveRecord::Migration[5.2]
  def change
  	add_reference :users, :ville, foreign_key: true
  end
end
