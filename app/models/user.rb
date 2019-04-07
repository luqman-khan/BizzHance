class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include SharedModelConcern
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    belongs_to :organization
    has_many :attendances

    validates :name,:role,:organization, presence: true
    enum role: [:owner, :admin, :employee]
    scope :capitalize_roles, -> () {roles.map{|k,v| [k.capitalize,k]}}

    

end
