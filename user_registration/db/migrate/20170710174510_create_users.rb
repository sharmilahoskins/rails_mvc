class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :street
      t.string :city
      t.string :state
      t.string :postal
      t.string :country
      t.string :email
      t.string :username
      t.string :password

      t.timestamps null:false
    end
  end
end
