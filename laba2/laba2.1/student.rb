require_relative 'student_short'

class Student<Student_short
  attr_reader :ID, :Name, :Surname, :Father_name, :Git, :Phone, :Tg, :Mail, :Git

  def initialize(name:, surname:, father_name:, other:{})
    @Name, @Surname, @Father_name = name, surname, father_name
    @ID = other["id"]
    @Git = other["git"]
    @Phone = other["phone"]
    @Mail = other["mail"]
    @Tg = other["tg"]
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
    account.match(/^@[\w\d\-_]+$/)
  end

  def Tg=(tg)
    raise ArgumentError, "Invalid value, Telegram account's correct form is @X where X is english alphabet sequence" if !tg.nil? && !Student.acc_valid?(tg)
    @Tg = tg
  end

  def Git=(git)
    raise ArgumentError, "Invalid value, Git's correct form is @X where X is english alphabet sequence" if !git.nil? && !Student.acc_valid?(git)
    @Git = git
  end

  def self.mail_valid?(mail)
    mail.match(/^[\w\d]+@[\w]+\.[\w]+$/)
  end


  def Mail=(mail)
    raise ArgumentError, "Invalid value, Mail's correct form is X@X.X where X is english alphabet sequence" if !mail.nil? && !Student.mail_valid?(mail)
    @Mail = mail
  end

  def set_contacts(mail:nil, tg:nil, phone:nil)
    if self.contacts?
      @Phone = phone if phone_valid?(phone)
      @Mail = mail if mail_valid?(mail)
      @Tg = tg if acc_valid?(tg)
    end
  end

  def to_s
    info=@Name.to_s+" "+@Surname.to_s+" "+@Father_name.to_s+" "
    info+=@Tg.to_s unless @Tg.nil?
    info+=@Phone unless @Phone.nil?
    info
  end

  def self.parse_str(str)
    str_student=str.split(', ').map{|x| x.split(':')}.to_h
    raise ArgumentError,"Invalid name" unless str_student.key?("name") && Student.name_valid?(str_student["name"])
    raise ArgumentError,"Invalid surname" unless str_student.key?("surname") && Student.name_valid?(str_student["surname"])
    raise ArgumentError,"Invalid father's name" unless str_student.key?("father_name") && Student.name_valid?(str_student["father_name"])
    if str_student.key?("tg")
      raise ArgumentError, "Invalid telegram" unless Student.acc_valid?(str_student["tg"])
    end
    if str_student.key?("git")
      raise ArgumentError, "Invalid git" unless Student.acc_valid?(str_student["git"])
    end
    if str_student.key?("mail")
      raise ArgumentError, "Invalid mail addres" unless Student.mail_valid?(str_student["mail"])
    end
    if str_student.key?("id")
      raise ArgumentError, "Invalid id" unless Student.id_valid?(str_student["id"])
    end
    if str_student.key?("phone")
      raise ArgumentError, "Invalid phone number" unless Student.phone_valid?(str_student["phone"])
    end
    Student.new(name:str_student["name"],surname:str_student["surname"],father_name:str_student["father_name"],other:str_student)
  end

  def getInfo
    "#{short_name}, #{contact}, #{git_to_s}"
  end

  def contact
    s=""
    s+= ", phone: #{@Phone}" unless @Phone.nil?
    s+= ", telegram: #{@Tg}" unless @Tg.nil?
    s+= ", mail: #{@Mail}" unless @Mail.nil?
    return s
  end

  protected
  def git_to_s
    return "" if git?
    ", git: #{@Git}"
  end

  def mail_to_s
    return "" if self.Mail.nil?
    ", email: #{@Mail}"
  end
  def tg_to_s
    return "" if self.Tg.nil?
    ", telegram: #{@Tg}"
  end

  def phone_to_s
    return "" if self.Phone.nil?
    ", phone: #{@Phone}"
  end

end