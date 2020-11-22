class CreateExpeditions < ActiveRecord::Migration[6.0]
  def change
    create_table :expeditions do |t|
      t.string :description
      t.binary :picture
      t.integer :user_id
      t.datetime :date_and_time
      t.float :latitude
      t.float :longitude
      t.string :location_name
      t.string :country
      t.string :state
      t.string :city
      t.string :street
      t.string :street_number
      t.string :zipcode
      t.string :address
      t.string :picture_fil_name
      t.string :picture_content_type
      t.integer :picture_fil_size
      t.string :picture_updated_at

      t.timestamps
    end
  end
end
