class CreateQuestionoptions < ActiveRecord::Migration
  def self.up
    create_table :questionoptions do |t|
      t.column  :title,           :string
      t.column  :ovalue,          :string
      t.column  :defaultvalue,    :string

      t.timestamps
    end
  end

  def self.down
    drop_table :questionoptions
  end
end
