class User < ActiveRecord::Base

  has_many :intermediateones
  has_many :messages, through: :intermediateones
  before_create :confirmation_token
  before_save :create_hashed_password
  after_save :erase_password

def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save
end

def self.authenticate_user(email, password)
    if(user = User.find_by_Email_Address(email))
      if(User.get_hashed_password(password) == user.hashed_password )
        return user;
      end
    end
    return false;
end


def self.get_hashed_password(password)
  return Digest::SHA1.hexdigest("The hashed password has #{password}")
end


def create_hashed_password
  unless self.Password.blank?
      self.hashed_password = Digest::SHA1.hexdigest("The hashed password has #{self.Password}")
  end
end

def erase_password
  self.Password = nil
end

def new_password(password)
  self.Password = password
  self.confirm_token = nil
  save
end




  

	def self.open_spreadsheet(file)
    if file
      case File.extname(file.original_filename)
        when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
        when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
        when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
        else raise "Unknown file type: #{file.original_filename}"
      end
    end

  end

  
  def self.import(file)
    if file
    	spreadsheet = open_spreadsheet(file)
    	header = spreadsheet.row(1)
    	(2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      user = find_by_id(row["id"]) || new
      user.attributes = row.to_hash#.slice(*accessible_attributes)
      user.save
      end
    end 
  end

  
  
  #def recent
   # order('created_at DESC')
  #end  

  scope :recent, lambda{where('created_at >= ?',Time.now - 5*60)}
 # scope :recent, -> {:limit => 30, :order => 'created_at DESC'}

private

def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
end




  			
end


