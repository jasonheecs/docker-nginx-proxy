require "serverspec"
require "spec_helper"
require "docker"

describe "Dockerfile" do
  let(:image) { Docker::Image.build_from_dir('./') }
  let(:container) { Docker::Container.create('Cmd' => ['ls'], 'Image' => image.id) }

  before(:each) do
    image.tag(repo: 'jasonheecs/nginx-proxy', tag: 'latest')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
    set :docker_container, container.id
    set :docker_container_create_options, { 'Entrypoint' => ['/bin/bash', '-s'] }
  end

  it "should have the maintainer label" do
    expect(image.json["Config"]["Labels"].has_key?("maintainer"))
  end

  describe package('nginx') do
    it { should be_installed }
  end

  describe file('/etc/nginx/conf.d/custom_proxy_settings.conf') do
    it { should be_file }
  end
end
