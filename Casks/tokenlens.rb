cask "tokenlens" do
  version "0.10.2"
  sha256 "805f9fe7308f591d037788b8bdbac2fac7d61f38b0b88859a950c614d6855974"

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
