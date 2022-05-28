FactoryBot.define do
  factory :product ,class: Product do
    title { 'Nice Home' }
    description { 'This House is nice' }
    localisation { 'Cotonou' }
    availability { 'Free' }
    remarks {'Blablabla' }
    cost { '25000' }
    user_id {1}
  end

    factory :product1 ,class: Product do
      title { 'Nice Home1' }
      description { 'This House is very nice' }
      localisation { 'Cotonou1' }
      availability { 'Free' }
      remarks {'Blablabla1' }
      cost { '75000' }
      user_id {1}
    end

      factory :product2 ,class: Product do
        title { 'Nice One Home' }
        description { 'This House is also nice' }
        localisation { 'Cotonou3' }
        availability { 'Free' }
        remarks {'Blablabla2' }
        cost { '125000' }
        user_id {1}
      end
end
