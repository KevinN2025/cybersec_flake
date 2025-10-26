{
  description = "A flake containg all the cybersec tools I need";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";        
    flake-part.url = "github:hercules-ci/flake-parts";
  };
   outputs =
    { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let pkgs = import nixpkgs 
      { system = "x86_64-linux"; config.allowUnfree = true; };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
              [zap metasploit wifite2 aircrack-ng sqlmap bloodhound responder john
              hashcat hashcat-utils badkeys pwntools mx-takeover cyberchef hexyl unifi
              shorewall shadow waf wafw00f honeytrap crowdsec snort
              suricata bettercap python313Packages.dpkt haskellPackages.nemesis yas
              zeek rustscan python313Packages.angr detect-it-easy capstone scilla
              commix]
          ];
        };
      }
    );
}


