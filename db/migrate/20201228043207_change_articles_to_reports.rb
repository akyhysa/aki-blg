class ChangeArticlesToReports < ActiveRecord::Migration[6.0]
  def change
    rename_table :articles, :reports
  end
end