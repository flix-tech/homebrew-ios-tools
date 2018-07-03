class ScreenshotframerCliFlixtech < Formula
  desc "With Screenshot Framer you can easily create nice-looking and localized App Store Images."
  homepage "https://github.com/IdeasOnCanvas/ScreenshotFramer"
  url "https://github.com/flix-tech/ScreenshotFramer.git",
    :branch => "flixtech",
    :revision => "7251745847a41e276c99c73716d0c41c8854dcf0"
  version "1.0"
  revision 1

  depends_on :xcode => ["9.0", :build]

  def install
    system "ln -sf /usr/bin/true ./.tools/SwiftLint/swiftlint"
    xcodebuild "-project", "Screenshot Framer.xcodeproj",
               "-scheme", "Screenshot-Framer-CLI",
               "DSTROOT=build/install",
               "SYMROOT=build",
               "INSTALL_PATH=/bin",
               "install"
    bin.install "build/install/bin/Screenshot-Framer-CLI"
  end

  test do
    system "#{bin}/Screenshot-Framer-CLI"
  end
end
