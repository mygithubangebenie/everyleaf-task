class Task < ApplicationRecord
    def self.order_list(sort_order)
        if sort_order == "priority"
          order(priority: :desc)
        elsif sort_order == "enddate"
          order(enddate: :desc)
        else
          order(startdate: :desc)
        end
      end
end
