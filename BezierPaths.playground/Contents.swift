//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let squareWidth = CGFloat(400)
let squareHeight = CGFloat(400)

var originPath = UIBezierPath()
originPath.move(to: CGPoint(x:50, y:50))
originPath.addLine(to: CGPoint(x:50, y:350))
originPath.addLine(to: CGPoint(x:350, y:200))
originPath.close()

var destinationPath = UIBezierPath()
destinationPath.move(to: CGPoint(x: 90, y:50))
destinationPath.addLine(to: CGPoint(x: 90, y:350))
destinationPath.move(to: CGPoint(x: 310, y:50))
destinationPath.addLine(to: CGPoint(x: 310, y:350))
//
var shape = CAShapeLayer()
shape.path = originPath.cgPath
//shape.strokeColor = UIColor.blue.cgColor
//shape.lineWidth = 2.0
shape.fillColor = UIColor.orange.cgColor

var view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: squareWidth, height: squareHeight))
view.backgroundColor = UIColor.clear
view.layer.addSublayer(shape)
PlaygroundPage.current.liveView = view

var pathAnimation = CABasicAnimation(keyPath: "path")
pathAnimation.fromValue = originPath.cgPath
pathAnimation.toValue = destinationPath.cgPath

let animStrokeColor = CABasicAnimation(keyPath: "strokeColor")
animStrokeColor.fromValue = UIColor.clear.cgColor
animStrokeColor.toValue = UIColor.blue.cgColor

let animStrokeWidth = CABasicAnimation(keyPath: "lineWidth")
animStrokeWidth.fromValue = 0.0
animStrokeWidth.toValue = 80.0

let animFillColor = CABasicAnimation(keyPath: "fillColor")
animFillColor.fromValue = UIColor.orange.cgColor
animFillColor.toValue = UIColor.clear.cgColor

var group = CAAnimationGroup()
group.animations = [pathAnimation, animStrokeColor, animStrokeWidth, animFillColor]
group.duration = 2.0
group.fillMode = kCAFillModeForwards
group.isRemovedOnCompletion = false
group.repeatCount = 0

DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
    shape.add(group, forKey: "viewChanges")
}

