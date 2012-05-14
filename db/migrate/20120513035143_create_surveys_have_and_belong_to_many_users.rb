class CreateSurveysHaveAndBelongToManyUsers < ActiveRecord::Migration
  def self.up
    create_table :users_surveys, :id => false do |t|
      t.references :survey, :user
    end
  end

  def self.down
    drop_table :users_surveys
  end
end
