namespace :dev do
  desc "Configurando ambiente"
  task setup: :environment do

    popular = PopulateDatabase.new
    popular.perform
  end
end



