class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.column  :applicationname,   :string,  :unique=>true

      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
