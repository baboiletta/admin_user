class CreateSectionEdits < ActiveRecord::Migration[6.0]
  def change
    create_table :section_edits do |t|
      t.integer "admin_user_id"
      t.integer "section_id"
      t.string "summary"
      t.timestamps
    end
  end
end
