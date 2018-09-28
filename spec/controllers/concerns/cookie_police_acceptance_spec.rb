RSpec.describe CookiePolicyAcceptance, type: :controller do
  controller(ApplicationController) do
    include CookiePolicyAcceptance
  end

  describe '.cookie_policy_accepted?' do
    subject { controller.cookie_policy_accepted? }

    context 'when the cookie policy has not been accepted' do
      it { is_expected.to eq(false) }
    end

    context 'when the cookie policy has been accepted' do
      before do
        request.cookie_jar.permanent['_cookie_policy_acceptance'] = 'y'
      end

      it { is_expected.to eq(true) }
    end
  end
end
