# flake.nix - Configured for Jaming Browser

{
  description = "Jaming Browser - A Privacy-Focused Firefox Fork";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        
        # Name of your Firefox fork
        forkName = "JamingBrowser";
        
        # Create a derivation for Jaming Browser
        jaming-browser = pkgs.stdenv.mkDerivation {
          name = forkName;
          
          # No build needed, just create a wrapper script
          phases = [ "installPhase" ];
          
          # Firefox to use
          nativeBuildInputs = [ pkgs.makeWrapper ];
          
          # Create the preference file
          installPhase = ''
            mkdir -p $out/bin
            mkdir -p $out/lib/${forkName}/browser/defaults/preferences
            
            # Create privacy preferences file
            cat > $out/lib/${forkName}/browser/defaults/preferences/privacy-prefs.js << 'EOF'
            // Set Jaming Browser branding
            pref("distribution.id", "org.jaming");
            pref("distribution.name", "Jaming Browser");
            pref("distribution.version", "1.0");
            pref("general.useragent.override", "Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Jaming/1.0");
            
            // Disable telemetry
            pref("toolkit.telemetry.enabled", false);
            pref("toolkit.telemetry.unified", false);
            pref("toolkit.telemetry.archive.enabled", false);
            pref("toolkit.telemetry.newProfilePing.enabled", false);
            pref("toolkit.telemetry.shutdownPingSender.enabled", false);
            pref("toolkit.telemetry.updatePing.enabled", false);
            pref("toolkit.telemetry.bhrPing.enabled", false);
            pref("toolkit.telemetry.firstShutdownPing.enabled", false);

            // Disable health reports
            pref("datareporting.healthreport.uploadEnabled", false);
            pref("datareporting.policy.dataSubmissionEnabled", false);
            pref("datareporting.sessions.current.clean", true);

            // Disable crash reports
            pref("browser.crashReports.unsubmittedCheck.enabled", false);
            pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

            // Disable Pocket integration
            pref("extensions.pocket.enabled", false);

            // Enhanced tracking protection
            pref("privacy.trackingprotection.enabled", true);
            pref("privacy.trackingprotection.socialtracking.enabled", true);
            pref("privacy.trackingprotection.fingerprinting.enabled", true);
            pref("privacy.trackingprotection.cryptomining.enabled", true);

            // Enable HTTPS-Only Mode
            pref("dom.security.https_only_mode", true);

            // Anti-fingerprinting
            pref("privacy.resistFingerprinting", true);

            // Set DuckDuckGo as default search engine
            pref("browser.urlbar.placeholderName", "DuckDuckGo");
            pref("browser.search.defaultenginename", "DuckDuckGo");

            // Enable DNS over HTTPS
            pref("network.trr.mode", 2);
            pref("network.trr.uri", "https://dns.quad9.net/dns-query");
            
            // Disable Firefox accounts
            pref("identity.fxaccounts.enabled", false);
            
            // Homepage and new tab settings
            pref("browser.startup.homepage", "about:home");
            pref("browser.newtabpage.enabled", true);
            pref("browser.newtabpage.activity-stream.showSponsored", false);
            pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
            EOF
            
            # Create a profile with custom settings
            mkdir -p $out/lib/${forkName}/browser/profile
            
            # Create a basic icon directory and placeholder
            mkdir -p $out/share/applications
            mkdir -p $out/share/icons/hicolor/128x128/apps
            
            # Create a desktop entry file
            cat > $out/share/applications/jaming-browser.desktop << EOF
            [Desktop Entry]
            Name=Jaming Browser
            Comment=Privacy-focused web browser
            Exec=$out/bin/JamingBrowser %u
            Icon=jaming-browser
            Terminal=false
            Type=Application
            Categories=Network;WebBrowser;
            MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;
            EOF
            
            # Add a touch file for the icon (in a real implementation, you'd create or copy an actual icon)
            touch $out/share/icons/hicolor/128x128/apps/jaming-browser.png
            
            # Create wrapper script that launches Firefox with our custom profile
            makeWrapper ${pkgs.firefox}/bin/firefox $out/bin/${forkName} \
              --add-flags "-profile $out/lib/${forkName}/browser/profile" \
              --add-flags "-no-remote" \
              --set MOZ_DISABLE_CONTENT_SANDBOX 1 \
              --set MOZ_APP_DISPLAYNAME "Jaming Browser"
          '';
          
          meta = with pkgs.lib; {
            description = "Jaming Browser - A privacy-focused web browser";
            homepage = "https://jaming-browser.org";  # Replace with your actual homepage
            license = licenses.mit;
            platforms = platforms.linux;
            maintainers = [ "Your Name" ];
          };
        };
        
        # A version that would be built from source (not implemented)
        jaming-browser-full = pkgs.stdenv.mkDerivation {
          pname = "jaming-browser-full";
          version = "1.0.0";
          
          # This is just a placeholder for now
          phases = [ "installPhase" ];
          
          installPhase = ''
            echo "This would build Jaming Browser from source with branding and privacy enhancements"
            mkdir -p $out/bin
            touch $out/bin/jaming-browser-full
            chmod +x $out/bin/jaming-browser-full
          '';
        };
      in
      {
        packages = {
          default = jaming-browser;
          
          # The full build package (commented out until implemented)
          # "jaming-browser-full" = jaming-browser-full;
        };
        
        # Development shell
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            firefox
            makeWrapper
          ];
          
          shellHook = ''
            echo "Welcome to the Jaming Browser development environment!"
            echo "Run 'nix build' to build the project."
          '';
        };
      }
    );
}
