class ChangeCoaster < ActiveRecord::Migration
  def change
    add_column :coasters, :video_url, :string
  end
end
