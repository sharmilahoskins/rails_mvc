class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.string :phone1
      t.string :phone2
      t.string :phone3
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
