class CreateQuestiontypes < ActiveRecord::Migration
  def self.up
    create_table :questiontypes do |t|
      t.column  :type,    :string
      t.column  :desc,    :string

      t.timestamps
    end
  end

  def self.down
    drop_table :questiontypes
  end
end
