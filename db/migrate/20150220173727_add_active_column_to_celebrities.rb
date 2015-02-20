class AddActiveColumnToCelebrities < ActiveRecord::Migration
  def change
    add_column :celebrities, :active, :boolean, :default => true
  end
end
