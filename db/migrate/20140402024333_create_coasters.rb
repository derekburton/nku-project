class CreateCoasters < ActiveRecord::Migration
  def change
    create_table :coasters do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :image_url

      t.timestamps
    end
  end
end
