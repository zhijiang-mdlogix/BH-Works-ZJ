class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.column  :title,   :string
      t.column  :sort,    :integer
      t.column  :code,    :string
      t.column  :qvalue,  :string

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
