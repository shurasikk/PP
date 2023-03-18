

class Student
  attr_accessor :ID, :Name, :Surname, :Father_name, :Git, :Phone, :Tg, :Mail, :Git

  def initialize(name:, surname:, father_name:, id:nil, git:nil, phone:nil, tg:nil, mail:nil)
    self.Name, self.Surname, self.Father_name = name, surname, father_name
    self.ID = id
    self.Git = git
    self.Phone = phone
    self.Mail = mail
    self.Tg = tg
  end

  def self.phone_valid?(phone)
    phone.match(/^\+?[7,8]{1}\-\d{3}\-\d{3}\-\d{2}\-\d{2}$/)
  end

  def Phone=(phone)
    raise ArgumentError("Invalid value, phone number's correct form is \"+7(8)-XXX-XXX-XX-XX\"") if !phone.nil? && !Student.phone_valid?(phone)
    @Phone = phone
  end

  def self.id_valid?(id)
    String(id).match(/^\d+$/)
  end

  def ID=(id)
    raise ArgumentError("Invalid value, id is digit sequence") if !id.nil? && !Student.id_valid?(id)
    @ID = id
  end

  def self.name_valid?(name)
    name.match(/^[А-Яа-я]+$/)
  end

  def Name=(name)
    raise ArgumentError("Invalid value, Name is russian alphabet sequence") if !name.nil? && !Student.name_valid?(name)
    @Name = name
  end

  def Surname=(surname)
    raise ArgumentError("Invalid value, Surname is russian alphabet sequence") if !surname.nil? && !Student.name_valid?(surname)
    @Surname = surname
  end

  def Father_name=(father_name)
    raise ArgumentError("Invalid value, Father name is russian alphabet sequence") if !father_name.nil? && !Student.name_valid?(father_name)
    @Father_name = father_name
  end

  def self.acc_valid?(account)
    account.match(/^@[\w\d-\-_]+$/)
  end

  def Tg=(tg)
    raise ArgumentError("Invalid value, Telegram account's correct form is @X \nwhere X is english alphabet sequence") if !tg.nil? && !Student.acc_valid?(tg)
    @Tg = tg
  end

  def Git=(git)
    raise ArgumentError("Invalid value, Git's correct form is @X \nwhere X is english alphabet sequence") if !git.nil? && !Student.acc_valid?(git)
    @Git = git
  end

  def self.mail_valid?(mail)
    mail.match(/^[\w\d]+@[\w]+\.[\w]+$/)
  end


  def Mail=(mail)
    raise ArgumentError("Invalid value, Mail's correct form is X@X.X \nwhere X is english alphabet sequence") if !mail.nil? && !Student.mail_valid?(mail)
    @Mail = mail
  end

  def git?
    !self.Git.nil?
  end

  def contacts?
    !self.Phone.nil? || !self.Tg.nil? || !self.Mail.nil?
  end

  def validate
    self.git? || self.contacts?
  end
  
  def to_s
    inf=@Name.to_s+" "+@Surname.to_s+" "+@Father_name.to_s+" "+@ID.to_s
    inf
  end
end