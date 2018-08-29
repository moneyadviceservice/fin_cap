module NavigationHelper
  WHAT_FIN_CAP = {
    'Financial capability levels in the UK' => Rails.application.routes.url_helpers.article_path('en', 'levels-uk'),
    'Financial capability - a global issue' => Rails.application.routes.url_helpers.article_path('en', 'global-issue')
  }.freeze

  WHO_FOR = {
    'Financial services' => Rails.application.routes.url_helpers.article_path('en', 'financial-services'),
    'Charities and third-sector organisations' => Rails.application.routes.url_helpers.article_path('en', 'charities-third-sector-organisations'),
    'Employers' => Rails.application.routes.url_helpers.article_path('en', 'employers'),
    'Researchers' => Rails.application.routes.url_helpers.article_path('en', 'researchers'),
    'Schools' => Rails.application.routes.url_helpers.article_path('en', 'schools'),
    'Parents' => Rails.application.routes.url_helpers.article_path('en', 'parents'),
    'Childrens services' => Rails.application.routes.url_helpers.article_path('en', 'childrens-services'),
    'Youth and students' => Rails.application.routes.url_helpers.article_path('en', 'youth-students'),
    'Individuals' => Rails.application.routes.url_helpers.article_path('en', 'individuals')
  }

  WHAT_IS_STRATEGY = {
    'UK Strategy' => '/uk_strategies/uk-strategy',
    'Northern Ireland' => Rails.application.routes.url_helpers.regional_strategy_path('en', 'northern-ireland'),
    'Scotland' => Rails.application.routes.url_helpers.regional_strategy_path('en', 'scotland'),
    'Wales' => Rails.application.routes.url_helpers.regional_strategy_path('en', 'wales')
  }

  WHY_STRATEGY_NEEDED = {
    'What The Strategy needs to achieve' => Rails.application.routes.url_helpers.article_path('en', 'what-strategy-needs-achieve'),
    'Evidence and analysis' => Rails.application.routes.url_helpers.article_path('en', 'evidence-analysis'),
    'Summary of key statistics on Financial Capability' => 'https://masassets.blob.core.windows.net/fincap-cms/files/000/000/070/original/Finanical_Capability_-_Key_Statistics.pdf',
    'Strategy development' => Rails.application.routes.url_helpers.article_path('en', 'development-strategy')
  }

  HOW_STRATEGY_DELIVERED = {
    'The role of the steering groups' => Rails.application.routes.url_helpers.article_path('en', 'role-steering-groups'),
    'The role of Money Advice Service' => Rails.application.routes.url_helpers.article_path('en', 'role-money-advice-service')
  }

  WHO_INVOLVED = {
    'The Financial capability Board' => Rails.application.routes.url_helpers.article_path('en', 'financial-capabilty-board'),
    'Steering Group and forums' => Rails.application.routes.url_helpers.article_path('en', 'steering-group-forums'),
    'IMPACT Principle Signatories' => Rails.application.routes.url_helpers.article_path('en', 'impact-principle-signatories'),
    'What Works Fund Grantees' => Rails.application.routes.url_helpers.article_path('en', 'what-works-grant-funded-projects'),
    'Get Involved' => 'http://fincap.org.uk/get-involved'
  }

  OUR_APPROACH = {
    'How to get involved' => Rails.application.routes.url_helpers.article_path('en', 'get-involved')
  }

  FIND_EVIDENCE = {
    'Evidence  Hub' => Rails.application.routes.url_helpers.article_path('en', 'financial-capability-evidence-hub'),
    'Financial capability in the UK' => Rails.application.routes.url_helpers.article_path('en', 'financial-capability-uk'),
    'Fincap Survey' => Rails.application.routes.url_helpers.article_path('en', 'financial-capability-survey')
  }

  EVALUATE_PROGRAMME = {
    'Evaluation Toolkit' => Rails.application.routes.url_helpers.article_path('en', 'evaluation-toolkit-overview'),
    'Impact Principles' => 'http://fincap.org.uk/impact-principles',
    'Funding' => Rails.application.routes.url_helpers.article_path('en', 'funding')
  }

  WHAT_WORKS = {
    'What Works Fund' => Rails.application.routes.url_helpers.article_path('en', 'what-works-fund'),
    'Funded Projects' => Rails.application.routes.url_helpers.article_path('en', 'what-works-grant-funded-projects'),
    'FinCap Labs' => Rails.application.routes.url_helpers.article_path('en', 'the-financial-capability-lab')
  }

  EVALUATE = {
    'Talk Money Week' => '/en/talkmoneyweek'
  }

  LIFE_STAGES_CHILDREN_YOUNG = {
    'Children and Young people steering group' => Rails.application.routes.url_helpers.article_path('en', 'children-young-people-steering-group'),
    'Steering group updates' => Rails.application.routes.url_helpers.article_path('en', 'children-young-people-steering-group-updates'),
    'Action Plan' => 'https://masassets.blob.core.windows.net/fincap-cms/files/000/000/093/original/Children___Young_People_Action_Plan.pdf'
  }

  LIFE_STAGES_YOUNG_ADULT = {
    'Young Adults steering group' => Rails.application.routes.url_helpers.article_path('en', 'young-adults-steering-group'),
    'Steering group updates' => Rails.application.routes.url_helpers.article_path('en', 'young-adults-steering-group-updates'),
    'Action Plan' => 'https://masassets.blob.core.windows.net/fincap-cms/files/000/000/094/original/Young_Adults_Action_Plan.pdf'
  }

  LIFE_STAGES_WORKING_AGE = {
    'Workplace steering group' => Rails.application.routes.url_helpers.article_path('en', 'workplace-steering-group'),
    'Steering group updates' => Rails.application.routes.url_helpers.article_path('en', 'workplace-steering-group-updates'),
    'Action Plan' => 'https://masassets.blob.core.windows.net/fincap-cms/files/000/000/095/original/Workplace_Action_Plan.pdf'
  }

  LIFE_STAGES_RETIREMENT_PLANNING = {
    'Retirement Planning steering group' => Rails.application.routes.url_helpers.article_path('en', 'retirement-planning-steering-group'),
    'Steering group updates' => Rails.application.routes.url_helpers.article_path('en', 'people-planning-retire-steering-group-updates'),
    'Action Plan' => 'https://masassets.blob.core.windows.net/fincap-cms/files/000/000/096/original/Retirement_Planning_Action_Plan.pdf'
  }

  LIFE_STAGES_RETIREMENT = {
    'People in retirement steering group' => Rails.application.routes.url_helpers.article_path('en', 'retirement-planning-steering-group'),
    'Steering group updates' => Rails.application.routes.url_helpers.article_path('en', 'people-retirement-steering-group'),
    'Action Plan' => 'https://masassets.blob.core.windows.net/fincap-cms/files/000/000/097/original/People_in_Retirement_Action_Plan.pdf'
  }

  LIFE_STAGES_FINANCIAL_DIFFICULTIES = {
    'Debt advice steering group' => Rails.application.routes.url_helpers.article_path('en', 'debt-advice-steering-group'),
    'Steering group updates' => Rails.application.routes.url_helpers.article_path('en', 'people-financial-difficulties-steering-group-updates'),
    'Action Plan' => 'https://masassets.blob.core.windows.net/fincap-cms/files/000/000/098/original/People_in_Financial_Difficulties_action_plan.pdf'
  }

  LIFE_STAGES_SAVING = {
    'Savings Steering group (members)' => Rails.application.routes.url_helpers.article_path('en', 'savings-steering-group'),
    'Steering group updates' => Rails.application.routes.url_helpers.article_path('en', 'savings-steering-group-updates'),
    'Action Plan' => 'https://masassets.blob.core.windows.net/fincap-cms/files/000/000/099/original/Savings_Action_Plan.pdf'
  }

  def render_level_1_heading(text)
    render 'navigation/level_1_heading', text: text
  end

  def render_level_2_heading(text)
    render 'navigation/level_2_heading', text: text
  end

  def render_level_2_subcategory_heading(text, link)
    render 'navigation/level_2_subcategory_heading', text: text, link: link
  end

  def render_level_2_extended_heading(text)
    render 'navigation/level_2_extended_heading', text: text
  end

  def render_level_2_subcategory_link(text, link)
    render 'navigation/level_2_subcategory_link', text: text, link: link
  end

  def render_level_3_heading(text)
    render 'navigation/level_3_heading', text: text
  end

  def render_level_3_subcategory_btn(text, link)
    render 'navigation/level_3_subcategory_btn', text: text, link: link
  end

  def render_level_3_subcategory_link (text, link)
    render 'navigation/level_3_subcategory_link', text: text, link: link
  end
end
