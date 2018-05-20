FactoryBot.define do
  factory :link, class: Link do
    created_at { Time.zone.parse('2017-01-01 11:30:00') }
    id 12345678
    short_url 'http://url_shortener.herokuapp.com/7clzi'
    long_url 'http://wwww.google.com'
    clicks 50
  end
end
