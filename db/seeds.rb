# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if ENV["topics_dir"]
    namedTopics = {}
    Dir.foreach(ENV["topics_dir"]) do |file|
        next if file == "." or file == ".."
        topicDirectory = ENV["topics_dir"] + "/" + file
        topicDescriptionFile = topicDirectory + "/description.yaml"
        topicContentsFile = topicDirectory + "/contents.md"
        topicInfo = YAML.load_file(topicDescriptionFile)
        topic = Topic.find_or_create_by!(title: topicInfo["title"])
        topic.update!(content: File.read(topicContentsFile))
        namedTopics[file] = {
            "id" => topic.id,
            "info" => topicInfo
        }
    end
    namedTopics.each do |name, info|
        if info["info"]["prereqs"]
            info["info"]["prereqs"].each do |prereq|
                source = namedTopics[name]["id"]
                preq = namedTopics[prereq]["id"]
                TopicPrerequisite.find_or_create_by!(source_topic_id: source, preq_topic_id: preq)
            end
        end
    end
end