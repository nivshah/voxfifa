class AddingReportedByColumnToMatches < ActiveRecord::Migration
  def up
    add_column :matches, :reported_by, :integer
  end

  def down
  end
end
