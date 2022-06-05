{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "nomad-driver-nspawn";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "bitmappergit";
    repo = pname;
    rev = "v${version}";
    # sha256 = "sha256-8owXwjQ0iPiNLXOZ9AOIDNuU5I90uca6MwRQVsExbro";
    # sha256 = "sha256-hIQFyFrd/u5tjqz/K0Ps2e9RkrSO3RpNcT36a61VeUE";
    # sha256 = "sha256-Jh10drslETtjNiDkTMOyMNGoIEY1EcJ5GDXYJh0zIIk";
    sha256 = "sha256-+4KqeRJL2jKnzxl+O6BFle3n+5IDXuOLSeShyw8cR1s=";
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
