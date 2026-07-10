cask "codex-touchbar-usage" do
  version "0.3.2"
  sha256 "624b97254a9722a11f78bbca90d0c46f9c9d5c102f90a77fef2910a93985090d"

  url "https://github.com/Daytimeflow/codex-touchbar-usage/archive/refs/tags/v#{version}.tar.gz"
  name "Codex Touch Bar Usage"
  desc "Native Codex quota and token monitor for the MacBook Pro Touch Bar"
  homepage "https://github.com/Daytimeflow/codex-touchbar-usage"

  depends_on macos: :monterey

  installer script: "codex-touchbar-usage-#{version}/scripts/install_touchbar_helper.sh"

  uninstall script: "codex-touchbar-usage-#{version}/scripts/uninstall_touchbar_helper.sh"

  caveats <<~EOS
    The helper is built locally with the installed Swift toolchain, starts automatically at login,
    and appears only while Codex or ChatGPT is focused.
  EOS
end
