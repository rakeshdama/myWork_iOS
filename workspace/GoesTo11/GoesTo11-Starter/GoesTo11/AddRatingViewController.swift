import UIKit

class AddRatingViewController: UIViewController {
  private (set) var rating: Int = 0

  @IBOutlet weak var ratingKnobContainer: UIView!
  @IBOutlet weak var ratingKnob: Knob!
  @IBOutlet weak var ratingLabel: UILabel!
  @IBOutlet weak var addRatingButton: UIButton!
  @IBOutlet weak var cancelButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()

    ratingKnob.lineWidth = 6
    ratingKnob.pointerLength = 12

    ratingKnob.setValue(Float(rating))
    setRating(ratingKnob.value)
    
    let ratingElement = RatingKnobAccessibilityElement(accessibilityContainer: self)
    accessibilityElements = [cancelButton, ratingElement, addRatingButton]
      .compactMap { $0 }
    UIAccessibility.post(notification: .screenChanged, argument: ratingElement)
  }

  func setRating(_ value: Float) {
    rating = Int(value.rounded())
    ratingLabel.text = "\(rating)"
  }

  @IBAction func knobValueChanged(_ sender: Knob) {
    setRating(sender.value)
  }
}

class RatingKnobAccessibilityElement: UIAccessibilityElement {
  override init(accessibilityContainer container: Any) {
    super.init(accessibilityContainer: container)
    accessibilityLabel = "Rating selector"
    accessibilityHint = "Adjust your rating of this amp"
  }
}

