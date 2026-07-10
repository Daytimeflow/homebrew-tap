class CodexTouchbarUsage < Formula
  desc "Native Codex quota and token monitor for the MacBook Pro Touch Bar"
  homepage "https://github.com/Daytimeflow/codex-touchbar-usage"
  url "https://github.com/Daytimeflow/codex-touchbar-usage/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "5fef009406148f38d8e97df77450e437c4853c5597717dbf84c8f4007d86ed2e"
  license "MIT"
  head "https://github.com/Daytimeflow/codex-touchbar-usage.git", branch: "main"

  depends_on macos: :monterey

  def install
    app = buildpath/"CodexTouchBarHelper.app"
    system "env", "APP_DIR=#{app}", "./scripts/build_touchbar_helper.sh"
    libexec.install app
    bin.install_symlink libexec/"CodexTouchBarHelper.app/Contents/MacOS/CodexTouchBarHelper" => "codex-touchbar-usage"
  end

  service do
    run opt_libexec/"CodexTouchBarHelper.app/Contents/MacOS/CodexTouchBarHelper"
    keep_alive true
    environment_variables CODEX_TOUCHBAR_TARGET_APPS: "Codex,ChatGPT,com.openai.codex"
    log_path var/"log/codex-touchbar-usage.out.log"
    error_log_path var/"log/codex-touchbar-usage.err.log"
  end

  def caveats
    <<~EOS
      Start the helper now and at login:
        brew services start daytimeflow/tap/codex-touchbar-usage

      Focus Codex or ChatGPT to display the Touch Bar usage panel.
    EOS
  end

  test do
    assert_predicate bin/"codex-touchbar-usage", :executable?
    assert_predicate libexec/"CodexTouchBarHelper.app/Contents/MacOS/CodexTouchBarHelper", :executable?
    assert_equal version.to_s, shell_output(
      "/usr/bin/plutil -extract CFBundleShortVersionString raw " \
      "#{libexec}/CodexTouchBarHelper.app/Contents/Info.plist",
    ).strip
  end
end
