cask "tokenlens" do
  version "0.9.0"
  sha256 "ced02840f81c39fd6736213a23c651327b273eb4f7a2929c7ba5f8319aa5f528"

  url "https://github.com/ercinio/token-lens/releases/download/v#{version}/TokenLens-#{version}.dmg"
  name "TokenLens"
  desc "AI coding agents in the Mac notch — monitor, approve, answer, and see your whole AI bill"
  homepage "https://ercinio.github.io/tokenlens-site/"

  livecheck do
    url "https://github.com/ercinio/token-lens/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "TokenLens.app"

  # Ad-hoc signed build: clear quarantine so first launch doesn't need right-click ▸ Open.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/TokenLens.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/TokenLens",
    "~/Library/Preferences/com.ercinio.TokenLens.plist",
  ]
end
