class Product < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, unless: :image?

  mount_uploader :image, ImageUploader

  enum availability: { Libre: 0, Immédiatement_Libre: 1, Bientôt_Libre: 2 }

  scope :ordered, -> { order(created_at: :desc) }

  scope :orderByAvailability,->{order(availability: :asc) }

  scope :orderByLocalisation,->{order(localisation: :asc) }

  scope :cost_sort, -> { order(cost: :desc) }

  scope :orderByCost,->{order(cost: :asc) }

  scope :localisation_sort, -> (search_localisation){ where(localisation: search_localisation) }

  scope :title_sort, -> (search_title){ where(title: search_title) }#ajout

  scope :search_sort, -> (search_word){ where('title LIKE ?', "%#{search_word}%") }

  scope :availability_sort, -> (search_availability){ where(availability: search_availability) }

  scope :cost_sort, -> (search_cost){ where(cost: search_cost) }

  scope :kaminari, -> (kaminari_page){ page(kaminari_page).per(5) }

  scope :current_user_sort,->(current_user_id){where(user_id: current_user_id)}
end
