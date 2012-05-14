class CreateOptiongroups < ActiveRecord::Migration
  def self.up
    create_table :optiongroups do |t|
      t.column  :name,    :string
      t.column  :title,   :string
      t.column  :sort,    :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :optiongroups
  end
end
