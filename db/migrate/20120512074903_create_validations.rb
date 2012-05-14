class CreateValidations < ActiveRecord::Migration
  def self.up
    create_table :validations do |t|
      t.column  :name,    :string
      t.column  :value,   :string

      t.timestamps
    end
  end

  def self.down
    drop_table :validations
  end
end
