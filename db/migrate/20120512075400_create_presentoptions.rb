class CreatePresentoptions < ActiveRecord::Migration
  def self.up
    create_table :presentoptions do |t|
      t.column  :available,   :boolean
      t.column  :visible,     :boolean
      t.column  :showtitle,   :boolean
      t.column  :offset,      :integer
      t.column  :seqtype,     :string
      t.column  :newseq,      :boolean
      t.column  :showseq,     :boolean
      t.column  :fieldset,    :boolean
      t.column  :fieldsettitle, :string

      t.timestamps
    end
  end

  def self.down
    drop_table :presentoptions
  end
end
