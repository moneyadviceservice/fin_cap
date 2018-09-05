module EvidenceHub::YearOfPublicationParser
  IGNORED_OPTION = 'All years'.freeze
  FILTER = 'year_of_publication'.freeze
  FINCAP_START_YEAR = 2000

  class << self
    def parse(year_option)
      return if year_option == IGNORED_OPTION

      years_array(year_option)
    end

    private

    def years_array(option)
      years_range[option]&.map do |n|
        n.year.ago.strftime('%Y').to_i
      end
    end

    def years_range
      {
        'Last 2 years' => (0..1),
        'Last 5 years' => (0..4),
        'More than 5 years ago' => (5..(Time.current.year - FINCAP_START_YEAR))
      }
    end
  end
end
