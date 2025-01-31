require 'csv'
class Gossip
    attr_accessor :author, :content
    def initialize(author, content)
        @author = author
        @content = content
    end

    def save
        CSV.open("./lib/db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
        end
    end

    def self.all
        all_gossips = []
        CSV.read("./lib/db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end

    def self.find(id)
        all_gossips = []
        CSV.read("./lib/db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips[id]
    end

    def update(new_author, new_content)
      gossips = Gossip.all
      gossips[@id].author = new_author
      gossips[@id].content = new_content

      CSV.open("./lib/db/gossip.csv", "w") do |csv|
        gossips.each do |gossip|
          csv << [gossip.author, gossip.content]
        end
      end
    end
end
