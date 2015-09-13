FactoryGirl.define do
  factory :car do |f|
  	f.id 1
  	f.name "Opel"
    f.description "Lorem Ipsum"
    f.category "A"
    f.price 100
  end
end
