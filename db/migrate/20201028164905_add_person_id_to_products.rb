class AddPersonIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :person_id, :integer
  end
end
