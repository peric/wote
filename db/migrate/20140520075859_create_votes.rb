class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :website, index: true
      t.references :user, index: true
      t.boolean :upvote

      t.timestamps
    end
    add_index :votes, [ :website_id, :user_id ], :unique => true
  end
end
