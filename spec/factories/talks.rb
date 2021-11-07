FactoryBot.define do
    factory :talk do
        title { "Test title for Pets" }    
        text { "Test text for Pets" }
        photo { Rack::Test::UploadedFile.new('spec/support/test_image.jpg', 'image/jpg') }
        theme { "Pets" }              
        user_id {15}
    end

    factory :random_talk, class: Talk do
        title {Faker::Lorem.sentence(word_count: 3)}
        text {Faker::Lorem.paragraph(sentence_count: 3)}
        photo {Rack::Test::UploadedFile.new('spec/support/test_image.jpg', 'image/jpg') }
        theme {Faker::Hobby.activity}
        user_id {15}
    end
end