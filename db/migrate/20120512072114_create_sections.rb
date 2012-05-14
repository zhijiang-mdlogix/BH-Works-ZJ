class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.column  :title,  :string
      t.column  :sort,   :integer

      t.belongs_to(:survey, :section)
      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
