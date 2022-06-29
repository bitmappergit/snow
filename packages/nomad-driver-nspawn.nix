{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "nomad-driver-nspawn";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "bitmappergit";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-I0M+/Bwhd7ueemLZTu/K1WmlhOx+78PKjMIowkVKuf8";
  };

  vendorSha256 = null;

  subPackages = [ "." ];

  doCheck = false;

  meta = with lib; {
    homepage = "https://www.github.com/JanMa/nomad-driver-nspawn";
    description = "systemd-nspawn task driver for Nomad";
    platforms = platforms.linux;
    license = licenses.mit;
    maintainers = [ "bitmappergit" ];
  };
}
