#
# Cookbook:: node-server
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'node-server::default' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it "should install nginx" do
      expect(chef_run).to install_package 'nginx'
    end
    it "enables the nginx service" do
      expect(chef_run).to enable_service 'nginx'
    end
    it "starts the nginx service" do
      expect(chef_run).to start_service 'nginx'
    end
    it "creates nginx.default" do
      expect(chef_run).to create_template('/etc/nginx/sites-available/default')
    end
    it "restarts nginx" do
      template = chef_run.template('/etc/nginx/sites-available/default')
      expect(template).to notify('service[nginx]').to(:reload)
    end
    it "checks if node is included" do
      expect(chef_run).to include_recipe 'nodejs'
    end
    it "checks if pm2 is installed" do
      expect(chef_run).to include_recipe 'pm2'
    end
    it "checks if npm is installed" do
      expect(chef_run).to include_recipe 'nodejs::npm'
    end
    it "checks if git is installed" do
      expect(chef_run).to include_recipe 'git'
    end
  end
end
