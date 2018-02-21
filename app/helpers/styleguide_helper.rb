module StyleguideHelper
  PRIMARY_COLOURS = {
    'yellow'     => '#FFCC00',
    'orange'     => '#EF7E25',
    'blue'       => '#0066CC',
    'blue-dark'  => '#003399',
    'green-pale' => '#51B9AF',
    'purple'     => '#663399'
  }.freeze

  SUPPORTING_COLOURS = {
    'blue' => '#41A0DA',
    'red' => '#C92628',
    'red-pale'     => '#E95E50',
    'green-dark'   => '#008996',
    'green-lime'   => '#8CC635',
    'blue-lighter' => '#e5ebf5'
  }.freeze

  MONO_COLOURS = {
    'black' => '#1D1D1B',
    'white' => '#FFFFFF'
  }.freeze

  GREYS = {
    'light'    => '#DADADA',
    'lighter'  => '#EBE9E9',
    'lightest' => '#F1F1F1'
  }.freeze

  COMPONENTS = {
    'Teaser box'   => 'teaser',
    'Hero image'   => 'hero',
    'Bordered box' => 'borderedbox',
    'Latest news'  => 'latestnews',
    'Download box' => 'downloads',
    'Feedback'     => 'feedback',
    'Large call to action' => 'largecta',
    'Side panel'           => 'sidepanel',
    'Evidence Type Icons'  => 'evidence_types'
  }.freeze

  LINKS = %w[Layout Typography Links Lists Colours].freeze
end
