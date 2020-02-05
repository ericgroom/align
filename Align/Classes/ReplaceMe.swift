import UIKit

@_functionBuilder
struct ConstraintBuilder {
    static func buildBlock(_ children: Constraint...) -> [Constraint] {
        children
    }
}

//let test = ConstraintBuilder {
//    Constraint(variety: .top, constant: 20.0)
//}

extension UIView {
    func align(subview: UIView, @ConstraintBuilder _ content: () -> [Constraint]) -> ConstraintSet {
        let children = content()
        var constraints = [NSLayoutConstraint]()
        for child in children {
            let constraint: NSLayoutConstraint
            switch child.variety {
            case .top:
                constraint = subview.topAnchor.constraint(equalTo: self.topAnchor, constant: child.constant)
            case .leading:
                constraint = subview.topAnchor.constraint(equalTo: self.topAnchor, constant: child.constant)
            case .trailing:
                constraint = subview.topAnchor.constraint(equalTo: self.topAnchor, constant: child.constant)
            case .bottom:
                constraint = subview.topAnchor.constraint(equalTo: self.topAnchor, constant: child.constant)
            }
            constraints.append(constraint)
        }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
}

let container = UIView()
let label = UILabel()
let constraints = container.align(subview: label) {
    Top()
    Bottom(constant: 20.0)
}

typealias ConstraintSet = [NSLayoutConstraint]

protocol Constraint {
    var variety: ConstraintType { get }
    var constant: CGFloat { get }
}

struct ConcreteConstraint: Constraint {
    let variety: ConstraintType
    let constant: CGFloat
    
    init(variety: ConstraintType) {
        self.variety = variety
        self.constant = 20.0
    }
}

struct Top: Constraint {
    let constant: CGFloat
    
    var variety: ConstraintType {
        return .top
    }
    
    init(constant: CGFloat = 0.0) {
        self.constant = constant
    }
}

struct Bottom: Constraint {
    let constant: CGFloat
    
    var variety: ConstraintType {
        return .top
    }
    
    init(constant: CGFloat = 0.0) {
        self.constant = constant
    }
}

enum ConstraintType {
    case top
    case leading
    case trailing
    case bottom
}
