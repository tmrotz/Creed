module HomeHelper

  def paypal_url(return_url)
    values = {
      :business => 'seller__biz@gmail.com',
      :cmd => '_xclick',
      :return => return_url,
      :invoice => id
    }
  end

end
