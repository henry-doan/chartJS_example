class Inventor < ActiveRecord::Base
    has_many :robots, dependent: :destroy

    def self.hired
        months = {}
        counts = select("count(*) AS count, date_trunc( 'month', hire_date) AS hire_date")
                         .where("EXTRACT(year FROM hire_date) = 2016")
                         .group("date_trunc( 'month', hire_date)")
                         .order("date_trunc( 'month', hire_date)")
        counts.each do |record|
            months[record.hire_date.strftime("%b")] = record.count
        end
        
        months
    end
end