cask "tokenlens" do
  version "0.10.4"
  sha256 "028266887d79178ccdeab07e40bcbd7aae3335abe4522aa959ec43035dfd1782"

  url "https://github.com/ercinio/token-lens/releases/download/v#{version}/Pagerbit-#{version}.dmg"
  name "Pagerbit"
  name "TokenLens"
  desc "AI coding agents in the Mac notch — monitor, approve, answer, and see your whole AI bill"
  homepage "https://ercinio.github.io/tokenlens-site/"

  livecheck do
    url "https://github.com/ercinio/token-lens/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "Pagerbit.app"

  # Ad-hoc signed build: clear quarantine so first launch doesn't need right-click ▸ Open.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Pagerbit.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Pagerbit",
    "~/Library/Application Support/TokenLens",
    "~/Library/Preferences/com.ercinio.TokenLens.plist",
  ]
end
