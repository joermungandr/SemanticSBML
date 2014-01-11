require 'typhoeus'
require 'json'

class SemanticSBML

  def self.get_supported_dbs
    JSON.parse(Typhoeus.get("http://www.semanticsbml.org/semanticSBML/annotate/imported_resources.json").response_body)["result"].uniq
  end

  def self.get_linked_ressources
    JSON.parse(Typhoeus.get("http://www.semanticsbml.org/semanticSBML/annotate/linked_resources.json").response_body)["result"].uniq
  end

  def self.consult(name,precision,full_info)
    #the arguments have to be valid
    raise "The precision argument has to be between 0 and 1" unless (0...1).include?(precision)
    raise "The info flag has to be 1 or 0" if ![1,0].include?(full_info)
  
    JSON.parse(Typhoeus.get("http://www.semanticsbml.org/semanticSBML/annotate/search.json?q=#{name}&precision=#{full_info}&full_info=#{full_info}").response_body)["result"].uniq.first
  end

  def self.show_matches(matches)
    matches.each do |elem|
      puts "hyperlink: #{elem["hyperlink"]}"
      puts "uri: #{elem["uri"]}"
      puts "name: #{elem["name"]}"
      puts ""
    end
  end

  def self.get_readable_miriam_urn(miriam_urn)
    Typhoeus.get("http://www.semanticsbml.org/semanticSBML/annotate/name?urn=#{miriam_urn}").response_body
  end

  def self.get_url_to_miriam_urn(miriam_urn)
    Typhoeus.get("http://www.semanticsbml.org/semanticSBML/annotate/name?urn=#{miriam_urn}").response_body
  end
end
