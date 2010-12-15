class User < ActiveRecord::Base

  has_one :plan

  attr_accessor :password_confirmation

  validates_presence_of :first
  validates_presence_of :last
  validates_presence_of :username
  validates_presence_of :password
  validates_uniqueness_of :username
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 6

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  def self.authenticate(username, password)
    user = self.find_by_username(username)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

  def paypal_encrypted(amount, item_name, var_quan)

    values = {
      :business => 'seller_1287031804_biz@gmail.com',
      :cmd => '_xclick',
      :upload => 1,
      :return => 'http://www.creed.trconsulting.railsplayground.net/',
      :amount => amount,
      :item_name => item_name,
      :item_number => self.id,
      :undefined_quantity => var_quan,
      :cert_id => "Q3MGNR3UNZJRY"
    }
    
    encrypt_for_paypal(values)

  end

  PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/paypal_cert.pem")
  APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")
  APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")

  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end

  private

  def password_non_blank
    errors.add(:password, "missing password") if hashed_password.blank?
  end

  def self.encrypted_password(password, salt)
    string_to_hash = password + "jebwojvbds" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

end
