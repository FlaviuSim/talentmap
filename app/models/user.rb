class User < ActiveRecord::Base
  has_one :location
  #ccepts_nested_attributes_for :location Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, 
    :learning_interest_list, :teaching_interest_list, :location_attributes

  accepts_nested_attributes_for :location,
                          :reject_if => lambda { |a| a[:address].blank? },
                          :allow_destroy => true
  validates_presence_of :name



  # Alias for <tt>acts_as_taggable_on :tags</tt>:
  acts_as_taggable_on :learning_interests, :teaching_interests
end
