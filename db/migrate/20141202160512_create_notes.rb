class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.belongs_to :user
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
