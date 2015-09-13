FactoryGirl.define do
  factory :booking do |f|
  	f.start_time Date.tomorrow
  	f.length 3
    f.client "Smith"
    f.car_id 1
  end
end