# encoding: UTF-8

require "rubygems"
require "bundler/setup"
require "json"

class BrazilianStates < Object
  
  def self.all
    @all ||= JSON.parse(File.open("#{Rails.root}/lib/states.json").read) 
    return @all
  end

  def self.names
    all.map{|x| [x["name"].titleize + " - " + x["acronym"].upcase, x["name"]]}
  end

  def self.find_by_name(name)
    all.find{|x| x["name"] == name.downcase}    
  end

  def self.find_cities_by_state(name)
    if name.present?
      find_by_name(name.downcase)["cities"].map{|x| [x.titleize, x]}
    else
      return []
    end
  end

end
