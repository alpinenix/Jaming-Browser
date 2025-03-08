// privacy-prefs.js - Firefox privacy preferences

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

// Disable Firefox accounts
pref("identity.fxaccounts.enabled", false);

// Enhanced tracking protection
pref("privacy.trackingprotection.enabled", true);
pref("privacy.trackingprotection.socialtracking.enabled", true);
pref("privacy.trackingprotection.fingerprinting.enabled", true);
pref("privacy.trackingprotection.cryptomining.enabled", true);
pref("privacy.trackingprotection.emailtracking.enabled", true);

// Disable prefetching
pref("network.dns.disablePrefetch", true);
pref("network.prefetch-next", false);
pref("network.predictor.enabled", false);
pref("network.http.speculative-parallel-limit", 0);

// Enable HTTPS-Only Mode
pref("dom.security.https_only_mode", true);
pref("dom.security.https_only_mode_ever_enabled", true);

// Disable WebRTC
pref("media.peerconnection.enabled", false);

// Anti-fingerprinting
pref("privacy.resistFingerprinting", true);
pref("privacy.resistFingerprinting.block_mozAddonManager", true);
pref("browser.display.use_document_fonts", 0);
pref("canvas.capturestream.enabled", false);

// Disable geolocation
pref("geo.enabled", false);

// Set DuckDuckGo as default search engine
pref("browser.urlbar.placeholderName", "DuckDuckGo");
pref("browser.urlbar.placeholderName.private", "DuckDuckGo");
pref("browser.search.defaultenginename", "DuckDuckGo");

// Enable DNS over HTTPS
pref("network.trr.mode", 2);
pref("network.trr.uri", "https://dns.quad9.net/dns-query");

// Disable Firefox studies
pref("app.shield.optoutstudies.enabled", false);

// Disable Normandy/Shield
pref("app.normandy.enabled", false);
pref("app.normandy.api_url", "");

// Disable form autofill
pref("browser.formfill.enable", false);
pref("extensions.formautofill.addresses.enabled", false);
pref("extensions.formautofill.creditCards.enabled", false);

// Clear history when Firefox closes
pref("privacy.sanitize.sanitizeOnShutdown", true);
pref("privacy.clearOnShutdown.cache", true);
pref("privacy.clearOnShutdown.cookies", true);
pref("privacy.clearOnShutdown.downloads", true);
pref("privacy.clearOnShutdown.formdata", true);
pref("privacy.clearOnShutdown.history", true);
pref("privacy.clearOnShutdown.offlineApps", true);
pref("privacy.clearOnShutdown.sessions", true);
pref("privacy.clearOnShutdown.siteSettings", false);

// Disable data collection for addons
pref("extensions.getAddons.cache.enabled", false);

// Disable Connectivity Service
pref("network.connectivity-service.enabled", false);

// Don't allow browser to install extensions automatically
pref("extensions.autoDisableScopes", 15);

// Disable sending pings
pref("browser.send_pings", false);
