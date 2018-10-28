namespace :synchronize_properties do
  desc 'Synchronizes the properties from Trovit'
  task trovit: :environment do
    source = Rails.root.join('feeds', 'trovit_mx.xml')

    puts "[#{DateTime.now}] Synchronizing..."

    DBRebuilder.run(source: source, provider: 'trovit')

    puts "[#{DateTime.now}] Finished."
  end
end