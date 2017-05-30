require 'pry'

class Restaurant
  @@all = []

  attr_accessor :name, :reviews

  def initialize name
    @name = name
    @reviews = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name name
    @@all.detect do |rest|
      name == rest.name
    end
  end

  def customers
    ary = []
    @reviews.each do |review|
      ary << review.customer
    end
    ary
  end
end
