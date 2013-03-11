task :seeder => "seeder:model"

namespace :seeder do

  #  Command Examples
  #    Save to db/fixtures/orders.rb
  #      bundle exec rake seeder:orders
  #    Print to console
  #      bundle exec rake seeder:orders print=true
  #
  #    All records of any specified model and print to console
  #      bundle exec rake seeder model=User print=true
  #
  #  Examples of make_seed
  #    make_seed(order, {:title => true, :exclude => %w[created_at updated_at], :constraints => ':id'})
  #    order.lines.each { |line| make_seed(line, :include => %w[id order_id]) }
  #
  #  Example output
  #    # =============== Order 10 ===============
  #
  #    Order.seed(:id) do |s|
  #      s.id = "10"
  #      s.state = "complete"
  #      s.user_id = "4"
  #      s.lines_total = "0.0"
  #      s.submitted_at = ""
  #    end
  #
  #    Line.seed(:id) do |s|
  #      s.id = "26"
  #      s.order_id = "10"
  #      s.variant_id = "101"
  #      s.quantity = "1"
  #      s.price = "16.0"
  #    end
  #
  #  Example
  #    make_seed(adjuster, {:title => true, :exclude => %w[created_at updated_at], :additional => %w[variant_ids]})
  #
  #  Output
  #    =============== Adjuster::Bulk 1 ===============
  #
  #    Adjuster::Bulk.seed(:id) do |s|
  #      s.id = 1
  #      s.type = "Adjuster::Bulk"
  #      s.description = "Book Bulk Discount"
  #      s.starting_on = nil
  #      s.ending_on = nil
  #      s.expired = false
  #      s.settings = {:discounts => {"21" => "35"}}
  #      s.variant_ids = [101, 111]
  #    end


  desc "Seed All of specified model (ex. model=Order)"
  task :model => :environment do
    model = ENV['model'].constantize
    seed(model.name.pluralize.downcase) do
      model.all.each { |r| make_seed(r, {:title => true}) }
    end
  end

  desc "Seed Travelers"
  task :travelers => :environment do
    # Since there is no model to directly access adjusters_variants, we need to seed from one of the main models
    seed('z01_travelers') do
      Supervisor.all.each do |supervisor|
        make_seed(supervisor, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      Assistant.all.each do |assistant|
        make_seed(assistant, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      Traveler.all.each do |traveler|
        make_seed(traveler, {:title => true, :exclude => %w[created_at updated_at], :additional => %w[partner_ids weekend_ids questionnaire_ids team_ids assistant_ids trip_ids]})
      end
      
      TripApproval.all.each do |approval|
        make_seed(approval, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      User.all.each do |user|
        make_seed(user, {:title => true, :exclude => %w[created_at updated_at], :additional => %w[role_ids]})
      end
    end
  end
  
  
  desc "Seed Trips"
  task :trips => :environment do
    # Since there is no model to directly access adjusters_variants, we need to seed from one of the main models
    seed('z00_trips') do
      Trip.all.each do |trip|
        make_seed(trip, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      Address.all.each do |address|
        make_seed(address, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      Organizer.all.each do |organizer|
        make_seed(organizer, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      Shipping.all.each do |shipping|
        make_seed(shipping, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      EventDetail.all.each do |event_detail|
        make_seed(event_detail, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      Contact.all.each do |contact|
        make_seed(contact, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      TripApproval.all.each do |trip_approval|
        make_seed(trip_approval, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      RequestDate.all.each do |request_date|
        make_seed(request_date, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      Answer.all.each do |answer|
        make_seed(answer, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      Questionnaire.all.each do |questionnaire|
        make_seed(questionnaire, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      AutoResponder.all.each do |auto_responder|
        make_seed(auto_responder, {:title => true, :exclude => %w[created_at updated_at]})
      end
      
      BethelConnection.all.each do |bethel_connection|
        make_seed(bethel_connection, {:title => true, :exclude => %w[created_at updated_at]})
      end
    end
  end

  # ==============================================================================================

  def seed(filename_base)
    header
    yield
    save_data filename_base
  end

  def header
    @data = "# Generated at #{Time.now} with\n"
    @data += "#   #{$0} #{$*.join(' ')}\n\n"
  end

  def make_seed(model, options = {})
    options = {:constraints => ":id"}.merge(options)
    @data += "# =============== #{model.class.name} #{model.id} ===============\n\n" if options[:title]
    @data += "#{model.class.name}.seed(#{options[:constraints]}) do |s|\n"
    model.attributes.each do |key, value|
      next if options[:exclude] && options[:exclude].include?(key)
      next if options[:include] && !options[:include].include?(key)
      if value.class.name == "Money"
        value_str = value.to_s
      elsif value.is_a? BigDecimal
        value_str = value.to_s
      elsif value.is_a?(Time) || value.is_a?(Date)
        value_str = %["#{value.to_s}"]
      else
        value_str = value.inspect
      end
      @data += %[  s.#{key} = #{value_str}\n]
    end
    if options[:additional]
      options[:additional].each do |attr|
        @data += %[  s.#{attr} = #{model.send(attr).inspect}\n]
      end
    end
    @data += "end\n\n"
  end

  def save_data(name)
    filename = "#{Rails.root}/db/fixtures/#{name}.rb"
    if ENV['print'] && ENV['print'] == 'true'
      puts @data
      puts "Seed data would be written to #{filename}"
    else
      File.open(filename, 'w') { |f| f.write(@data) }
      puts "Seed data written to #{filename}"
    end
  end

end