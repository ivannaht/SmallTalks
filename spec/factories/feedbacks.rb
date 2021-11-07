FactoryBot.define do
    factory :feedback do
        recommendation {"yes"}  
        experience {"Experience one two"}               
        user_id {15}
    end

    factory :random_feedback, class: Feedback do
        recommendation {"no"} 
        experience {Faker::Lorem.paragraph(sentence_count: 3)}        
        user_id {15}
    end
end