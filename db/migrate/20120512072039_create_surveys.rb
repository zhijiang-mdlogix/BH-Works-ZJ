class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.column  :name,    :string
      t.column  :desc,    :string

      t.timestamps
    end
  end

  def self.down
    drop_table :surveys
  end
end
