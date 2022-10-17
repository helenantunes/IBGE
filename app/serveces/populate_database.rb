class PopulateDatabase

  def perform
    infos = get_state_infos
    create_regions!(infos)
    create_states!(infos)
    create_cities!(infos)
  end

  private

  def get_state_infos
    information = HTTParty.get("https://brasilapi.com.br/api/ibge/uf/v1")
    JSON.parse(information.to_s)
  end

  def create_regions!(infos)
    infos_regions = infos.map do |info|
      info["regiao"]
    end
    infos_regions = infos_regions.uniq
    infos_regions.each do |info_region|
      region = Region.new
      region.initials = info_region["sigla"]
      region.name = info_region["nome"]
      region.save!
    end
    puts "Regioes #{Region.count}"
  end

  # infos.each do |info|
  #   info_region = info["regiao"]
  #   region = Region.new
  #   region.initials = info_region["sigla"]
  #   region.name = info_region["nome"]
  #   if Region.find_by(initials: info_region["sigla"])
  #     region.save!
  #   end
  # end

  def create_states!(infos)
    infos.each do |info|
      state = State.new
      state.initials = info["sigla"]
      state.name = info["nome"]
      locate_region = info["regiao"]
      region = Region.find_by(name: locate_region["nome"])
      state.region = region
      State.find_by(initials: info["sigla"])
      state.save!
    end
    puts "Estados #{State.count}"
  end

  def create_cities!(infos)
    State.all.each do |state|
      initial = state.initials
      information_cities = HTTParty.get("https://brasilapi.com.br/api/ibge/municipios/v1/#{initial}?providers=dados-abertos-br,gov,wikipedia")
      cities = JSON.parse(information_cities.to_s)
      cities.each do |county|
        city = City.new
        city.name = county["nome"]
        infos.each do |info|
          if initial == info["sigla"]
            state_id = State.find_by(initials: info["sigla"])
            city.state = state_id
            city.save!
          end
        end
      end
    end
    puts "Cidades #{City.count}"
  end
end