class RenameModuleToSection < ActiveRecord::Migration
  def change
    rename_table :modules, :sections
  end
end
