class Contact < ActiveRecord::Base
  require 'csv'

  has_many :phones
  accepts_nested_attributes_for :phones

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phones, length: { is: 3 }

  def name
    [firstname, lastname].join(' ')
  end

  def self.by_letter(letter)
    where("lastname LIKE ?", "#{letter}%").order(:lastname)
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << ['firstname', 'lastname', 'email']
      all.each do |contact|
        csv << contact.attributes.values_at('firstname', 'lastname', 'email')
      end
    end
  end
end
