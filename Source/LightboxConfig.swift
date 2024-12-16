import UIKit
import AVKit
import AVFoundation

public class LightboxConfig {
  /// Whether to show status bar while Lightbox is presented
  @MainActor
  public static var hideStatusBar = true
  @MainActor
  public static var imageBackgroundColor = UIColor.black

  /// Provide a closure to handle selected video
  @MainActor
  public static var handleVideo: (_ from: UIViewController, _ videoURL: URL) -> Void = { from, videoURL in
    let videoController = AVPlayerViewController()
    videoController.player = AVPlayer(url: videoURL)

    from.present(videoController, animated: true) {
      videoController.player?.play()
    }
  }

  /// How to load image onto SDAnimatedImageView
  @MainActor
  public static var loadImage: ((UIImageView, URL, ((UIImage?) -> Void)?) -> Void)?

  /// Indicator is used to show while image is being fetched
  @MainActor
  public static var makeLoadingIndicator: () -> UIView = {
    return LoadingIndicator()
  }

  /// Number of images to preload.
  ///
  /// 0 - Preload all images (default).
  @MainActor
  public static var preload = 0

  @MainActor
  public struct PageIndicator {
    public static var enabled = true
    public static var separatorColor = UIColor(hex: "3D4757")

    public static var textAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 12),
      .foregroundColor: UIColor(hex: "899AB8"),
      .paragraphStyle: {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
      }()
    ]
  }

  @MainActor
  public struct CloseButton {
    public static var enabled = true
    public static var size: CGSize?
    public static var text = NSLocalizedString("Close", comment: "")
    public static var image: UIImage?

    public static var textAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.boldSystemFont(ofSize: 16),
      .foregroundColor: UIColor.white,
      .paragraphStyle: {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
      }()
    ]
  }

  @MainActor
  public struct DeleteButton {
    public static var enabled = false
    public static var size: CGSize?
    public static var text = NSLocalizedString("Delete", comment: "")
    public static var image: UIImage?

    public static var textAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.boldSystemFont(ofSize: 16),
      .foregroundColor: UIColor(hex: "FA2F5B"),
      .paragraphStyle: {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
      }()
    ]
  }

  @MainActor
  public struct InfoLabel {
    public static var enabled = true
    public static var textColor = UIColor.white
    public static var ellipsisText = NSLocalizedString("Show more", comment: "")
    public static var ellipsisColor = UIColor(hex: "899AB9")

    public static var textAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: 12),
      .foregroundColor: UIColor(hex: "DBDBDB")
    ]
  }

  @MainActor
  public struct Zoom {
    public static var minimumScale: CGFloat = 1.0
    public static var maximumScale: CGFloat = 3.0
  }
}
