cask "tokenlens" do
  version "0.10.1"
  sha256 "12ac70473b375798c52c043aa90fa9a507ddee1678f0eec48456dee16b892f23"

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
