FactoryBot.define do
  factory :product ,class: Product do
    title { 'Nice Home' }
    description { 'This House is nice' }
    localisation { 'Cotonou' }
    availability { 'Libre' }
    remarks {'Blablabla' }
    cost { '25000' }
    user_id {1}
    id {1}
  end

    factory :product1 ,class: Product do
      title { 'Nice Home1' }
      description { 'This House is very nice' }
      localisation { 'Cotonou1' }
      availability { 'Libre' }
      remarks {'Blablabla1' }
      cost { '75000' }
      user_id {1}
        id {2}
    end

      factory :product2 ,class: Product do
        title { 'Nice One Home' }
        description { 'This House is also nice' }
        localisation { 'Cotonou3' }
        availability { 'Libre' }
        remarks {'Blablabla2' }
        cost { '125000' }
        user_id {1}
          id {3}
      end

      factory :product4 ,class: Product do
        title { 'One Home' }
        description { 'This House is also nice' }
        localisation { 'Cotonou3' }
        availability { 'Libre' }
        remarks {'Blablabla2' }
        cost { '125000' }
        user_id {1}
          id {4}
      end
end
