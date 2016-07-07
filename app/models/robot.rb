class Robot < ActiveRecord::Base
  belongs_to :inventor

  def self.by_industry
  	robots= {}
  	results = select('count(*) As Count, industry')
  						.group(:industry)
  	results.each do |r|
  		robots[r.industry] = r.count
  	end

  	robots
  end
end
