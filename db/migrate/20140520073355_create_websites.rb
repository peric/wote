class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :url
      t.string :category
      t.string :screenshot

      t.timestamps
    end
  end
end
