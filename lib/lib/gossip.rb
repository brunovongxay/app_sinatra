require 'csv'

class Gossip

  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content  = content
  end

  def save
  CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @content]
    end
  end

  def self.all
  all_gossips = []
  CSV.read("./db/gossip.csv").each do |csv_line| # Parcourir le csv afin de créer et afficher un array
    all_gossips << Gossip.new(csv_line[0], csv_line[1]) # concaténer author et content
  end
  return all_gossips #retourne l'array dans le controller afin d'afficher son contenu dans l'index.erb
  end

  def self.find(id) 
      return self.all[id.to_i] #retourne id demandé dans l'array des tous les potins
  end
end