class CreateLeadnotes < ActiveRecord::Migration[5.2]
  def change
    create_table :leadnotes do |t|
      t.string :status
      t.string :next_steps
      t.string :comments
      t.references :lead, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
