class UpdatePlayer < ActiveRecord::Migration
  def up
    add_column :players, :name, :string
  end

  def down
  end
end
