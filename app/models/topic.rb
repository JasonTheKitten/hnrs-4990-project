class Topic < ApplicationRecord
    has_many :topic_prerequisites, class_name: "TopicPrerequisite", foreign_key: "source_topic_id"
    has_many :prerequisites, through: :topic_prerequisites, source: :preq_topic

    has_many :topic_nextsteps, class_name: "TopicPrerequisite", foreign_key: "preq_topic_id"
    has_many :nextsteps, through: :topic_nextsteps, source: :source_topic
end
