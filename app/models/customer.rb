require 'pry'

class Customer
  @@all = []

  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @reviews = []
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name name
    @@all.detect do |cust|
      name == cust.full_name
    end
  end

  def self.find_all_by_first_name name
    @@all.select do |cust|
      name == cust.first_name
    end
  end

  def self.all_names
    ary = []
    @@all.map do |cust|
      ary << cust.full_name
    end
    ary
  end

  def add_review restaurant, content
    review = Review.new(restaurant, content)
    review.customer = self
    @reviews << review
  end
end
