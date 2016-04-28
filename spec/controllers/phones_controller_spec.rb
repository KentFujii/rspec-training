require 'rails_helper'

describe PhonesController do
  describe 'GET #show' do

    it 'renders the :show templete for the phone' do
      contact = create(:contact)
      phone = create(:phone, contact: contact)
      # 下記: contact.id だけでなく contactのみでも通る
      # get :show, id: phone, contact_id: contact
      get :show, id: phone, contact_id: contact.id
      expect(response).to render_template :show
    end
  end
end
