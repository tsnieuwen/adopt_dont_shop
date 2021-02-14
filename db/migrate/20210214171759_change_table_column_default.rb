class ChangeTableColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:applications, :application_status, 'In Progress')
  end
end
