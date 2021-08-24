require 'spec_helper'

describe 'gitea' do
  let :node do
    'bla.example.com'
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os} " do
      let :facts do
        os_facts
      end

      context 'with all defaults' do
        it { is_expected.not_to compile.with_all_deps }
      end

      context 'with minimal params' do
        let :params do
          {
            database_host: '127.0.0.1',
            database_password: 'password'
          }
        end

        it { is_expected.to compile.with_all_deps }
      end
    end
  end
end
