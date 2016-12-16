class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:shoes) do |t|
      t.column(:name, :string)

      t.timestamps
    end

    create_table(:stores) do |t|
      t.column(:name, :string)
      t.column(:location, :string)

      t.timestamps
    end
    create_table(:shoes_stores) do |t|
      t.column(:shoe_id, :integer)
      t.column(:store_id, :integer)
    end
  end
end
