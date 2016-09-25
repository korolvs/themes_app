class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.index  :id
      t.string :name
      t.string :primary
      t.string :secondary
      t.string :background

      t.timestamps
    end
  end
end
