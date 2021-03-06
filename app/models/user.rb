class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   has_many :regions, through: :user_regions
   has_many :images, as: :imageable
    belongs_to :company
    belongs_to :UserRole


    validates :first_name, presence: true
    
   def end_date_after_start_date?
    if end_date.present?
     if end_date < start_date
       errors.add :end_date, "must be after start date"
      end
    end
   end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
