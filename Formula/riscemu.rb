class Riscemu < Formula
  include Language::Python::Virtualenv
  desc "RISC-V (userspace) emulator in python"
  homepage "https://github.com/AntonLydike/riscemu"
  url "https://files.pythonhosted.org/packages/68/1c/7dba15a9ac2edbb705e7a7bfa5172b6a013edcb33f7a4d82ee971983a703/riscemu-2.0.5.tar.gz"
  version "2.0.5"
  sha256 "dde8f8ce0386f34981ca7feb2fc67e50ec35a3ba421ce063eb727efaab885200"
  depends_on "python3"
  def install
    virtualenv_create(libexec, "python3")
    virtualenv_install_with_resources
    create_wrapper
    bin.install "riscemu_wrapper" => "riscemu"
  end
  private def create_wrapper
    wrapper = "#!/usr/bin/env sh
    #{prefix}/libexec/bin/python -m riscemu \"$@\""
    File.write("riscemu_wrapper", wrapper)
  end
  resource "pyelftools" do
    url "https://files.pythonhosted.org/packages/0e/35/e76da824595452a5ad07f289ea1737ca0971fc6cc7b6ee9464279be06b5e/pyelftools-0.29.tar.gz"
    sha256 "ec761596aafa16e282a31de188737e5485552469ac63b60cfcccf22263fd24ff"
  end
end
