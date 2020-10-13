class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, :age, presence: true
    validates :name, uniqueness: true
    validates :age, numericality: { only_integer: true, greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def featured_post 
        most_liked_post = self.posts.first
        self.posts.each do |post|
            if post.likes > most_liked_post.likes
                most_liked_post = post
            end
        end
        most_liked_post
    end

    def total_likes
        total_likes = 0
        self.posts.each do |post|
            total_likes += post.likes
        end
        total_likes
    end

    def top_five
        destinations_count = {}
        self.posts.each do |post|
            if destinations_count[post.destination.name]
                destinations_count[post.destination.name] += 1
            else
                destinations_count[post.destination.name] = 1
            end
        end
        #{"Myr"=>2, "Astapor"=>1, "Qohor"=>1, "Lys"=>1}

        sorted = destinations_count.sort_by(&:last).reverse
        #[["Myr", 2], ["Lys", 1], ["Qohor", 1], ["Astapor", 1]]

        final_array = []
        count = 0

        if sorted.length < 5
            sorted.length.times do
                final_array << sorted[count][0]
                count += 1
            end
        else
            5.times do
                final_array << sorted[count][0]
                count += 1
            end
        end
        final_array
    end
end
