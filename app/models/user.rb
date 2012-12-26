class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
   :username, :scoreplayer, :scorecreator, :firstname, :lastname, #iquizzer
   :login
  # attr_accessible :title, :body
  
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  
  has_many :dispositivos
  has_many :jogos
  #has_and_belongs_to_many :quizzes
  has_many :quizzes
  
  
  #https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  def self.find_for_database_authentication(conditions={})
    self.where("username = ?", conditions[:login]).limit(1).first ||
    self.where("email = ?", conditions[:login]).limit(1).first
  end
  # function to handle user's login via email or username
  #def self.find_for_database_authentication(warden_conditions)
  #  conditions = warden_conditions.dup
  #  if login = conditions.delete(:login).downcase
  #    where(conditions).where('$or' => [ {:username => /^#{Regexp.escape(login)}$/i}, {:email => /^#{Regexp.escape(login)}$/i} ]).first
  #  else
  #    where(conditions).first
  #  end
 # end 
end
