RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  RailsAdmin.config do |config|
    config.authorize_with do
      authenticate_or_request_with_http_basic('Site Message') do |username, password|
        username == ENV["Admin_username"] && password == ENV["Admin_password"]
      end
    end

    config.main_app_name { ['My App', 'Admin'] }

    config.model 'Session' do
      create do
        field :start_date
        field :end_date
        field :location
        field :course
        field :sku
        field :price
      end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
