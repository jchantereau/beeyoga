class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :messages, :message, :content
  end
end
