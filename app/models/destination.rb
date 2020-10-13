class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts


    def recent_5_posts


    end


    def featured_post


    end


    def all_blogger_ages
        self.bloggers.collect{ |e_blogger| e_blogger.age }
    end 
    def bloggers_average_age

        ## Avoid Division-By-0 Error
        if(self.bloggers.count == 0)
           return 0
        end 

        self.bloggers.collect{ |e_blogger| e_blogger.age }.sum / self.bloggers.count


    end 


end
