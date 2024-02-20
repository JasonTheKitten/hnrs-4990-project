class TopicPrerequisite < ApplicationRecord
  belongs_to :source_topic, class_name: "Topic"
  belongs_to :preq_topic, class_name: "Topic"
end
