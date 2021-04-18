class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title #present and unique??
      t.text :body #make minimum 50 chars???
      t.timestamps
    end
  end
end
