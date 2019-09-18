class CreateLeadlists < ActiveRecord::Migration[5.2]
  def change
    create_table :leadlists do |t|
      t.references :lead, foreign_key: true
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
