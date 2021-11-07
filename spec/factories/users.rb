FactoryBot.define do
    
    factory :user do
        first_name { "John" }
        last_name  { "Doe" }
        nickname  { "jo_do" }
        dob { 18.years.ago }
        email { "#{first_name}.#{last_name}@example.com".downcase }
        photo { Rack::Test::UploadedFile.new('spec/support/user_image.jpg', 'image/jpg') }
        admin { false }
    end

    factory :random_user, class: User do
        first_name {Faker::Name.first_name}
        last_name {Faker::Name.last_name}          
        nickname {Faker::Emotion.noun}   
        dob {Faker::Date.between(from: 100.years.ago, to: 18.years.ago)}
        email { "#{first_name}.#{last_name}@example.com".downcase }
        photo { Rack::Test::UploadedFile.new('spec/support/user_image.jpg', 'image/jpg') }
        admin { false }
        
    end



end