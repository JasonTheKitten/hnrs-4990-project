class CreateTopicPrerequisites < ActiveRecord::Migration[7.1]
  def change
    create_table :topic_prerequisites do |t|
      t.references :source_topic, null: false, foreign_key: { to_table: :topics }
      t.references :preq_topic, null: false, foreign_key: { to_table: :topics }

      t.timestamps
    end
  end
end
