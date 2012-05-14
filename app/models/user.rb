class User < ActiveRecord::Base

  has_and_belongs_to_many :roles
  scope :patient, joins(:role).where('roles.name = ?', 'Patient')
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :birthday, :lastname, :username, :mrn, :email, :password, :password_confirmation, :remember_me, :usertype, :staffemail

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  attr_accessible :login

  # Overrides the devise method find_for_authentication
  # Allow users to Sign In using their username or email address
  def self.find_for_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
  end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  def self.getUserByType(usertype)
    User.where("usertype = '#{usertype.to_s}'").order('firstname')
  end

  def self.getUsersByRole(role)
    self.users.patient
  end


end
