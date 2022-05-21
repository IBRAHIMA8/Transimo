class Product < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  enum availability: { Free: 0, Immediatly: 1, Notfree: 2 }

  scope :ordered, -> { order(created_at: :desc) }

  scope :orderByAvailability,->{order(availability: :desc) }

  scope :orderByLocalisation,->{order(localisation: :desc) }

  scope :cost_sort, -> { order(cost: :desc) }

  scope :orderByCost,->{order(cost: :asc) }




  # scope :filter_by_localisation, -> (localisation) { where localisation: localisation }
  # scope :filter_by_availability, -> (availability) { where availability: availability }
  #scope :filter_by_cost, -> (cost) { where cost: cost }
  #scope :filter_by_starts_with, -> (title) { where("title like ?", "#{title}%")}


  scope :localisation_sort, -> (search_localisation){ where(localisation: search_localisation) }
  scope :search_sort, -> (search_word){ where('title LIKE ?', "%#{search_word}%") }
  scope :availability_sort, -> (search_availability){ where(availability: search_availability) }
  scope :cost_sort, -> (search_cost){ where(cost: search_cost) }
  scope :kaminari, -> (kaminari_page){ page(kaminari_page).per(8) }
  scope :current_user_sort,->(current_user_id){where(user_id: current_user_id)}
end
