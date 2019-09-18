class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :company
      t.string :company_industry
      t.string :company_size
      t.integer :confidence_score
      t.string :website
      t.string :phone_number
      t.string :linkedin
      t.date :contacted_date

      t.timestamps
    end
  end
end
