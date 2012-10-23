class RemoveReportedByColumnFromMatches < ActiveRecord::Migration
  def up
    remove_column :matches, :reported_by
  end

  def down
    add_column :matches, :reported_by, :integer
  end
end
